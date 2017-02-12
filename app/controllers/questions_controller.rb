class QuestionsController < ApplicationController
  #before_action :confirm_logged_in, :except => [:home, :quiz_mode, :result]
  before_action :authenticate_user!, :except => [:home, :quiz_mode, :result]
  before_action :check_user, :only => [:edit, :delete, :update, :destroy, :show]

  def home
    @users = User.all
  end

  def quiz_mode
    @question = Question.where(:user_id => params[:id]).order("RANDOM()").first
  end

  def result
    @question = Question.find(params[:id])
    @question_params = question_params[:answer]

  
    @correct_answer_in_numbers = NumbersInWords.in_numbers(@question.answer.strip) 
    @user_answer_in_numbers = NumbersInWords.in_numbers(question_params[:answer].strip) 
  

    if @question.answer.split.join(" ").upcase == question_params[:answer].split.join(" ").upcase
      @result = "Answer by user on Quiz mode: " + question_params[:answer] + "   CORRECT "
 
    elsif @correct_answer_in_numbers == @user_answer_in_numbers &&
          @correct_answer_in_numbers != 0 &&
          @user_answer_in_numbers != 0

      @result = "Answer by user on Quiz mode: " + question_params[:answer] + "   CORRECT "

    elsif (@question.answer.strip == "0" || @question.answer.strip.upcase == "ZERO") &&
          (question_params[:answer].strip == "0" || question_params[:answer].strip.upcase == "ZERO")
    
      @result = "Answer by user on Quiz mode: " + question_params[:answer] + "   CORRECT "

    else
      @result = "Answer by user on Quiz mode: " + question_params[:answer] + "   INCORRECT "
    
    end

  end

  def index
    @questions = Question.where(:user_id => current_user.id).order(:created_at)
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
    @questions = Question.where(:user_id => current_user.id).order(:created_at)
  end

  def create
    
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    @questions = Question.where(:user_id => current_user.id).order(:created_at)

    if @question.save
      flash[:notice] = "Question created successfully."
      redirect_to(question_path(@question))
    else
      render("new")
    end

  end

  def edit
    @question = Question.find(params[:id])
  end


  def update

    @question = Question.find(params[:id])

    if @question.update_attributes(question_params)
      flash[:notice] = "Question updated successfully."
      redirect_to(question_path(@question))
    else
      render("edit")
    end  
  
  end


  def delete
    @question = Question.find(params[:id])
  end


  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Question destroyed successfully."
    redirect_to questions_path
  end


  private

  def check_user
    @user = Question.find(params[:id])

    if (@user.user_id != current_user.id)
      redirect_to questions_path
    end

  end

  def question_params
    params.require(:question).permit(:content, :answer)
  end

end
