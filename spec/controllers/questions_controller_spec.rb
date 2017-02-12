require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  describe "anonymous user" do
    before :each do
      # This simulates an anonymous user
      login_with nil
    end

    it "should be redirected to signin on index" do
      get :index
      expect( response ).to redirect_to( new_user_session_path )
    end

    it "should be redirected to signin on show" do
	  user = User.create(:email => "alice@gmail.com", :first_name => "Alice", :last_name => "Adolfo", :birthday => Time.now, :gender => "M", :password => "aaaaaa")
      question = Question.create(:content => "5 plus 5 is?", :answer => "10", :user_id => user.id )

      get :show, params: {id: question.id}
      expect( response ).to redirect_to( new_user_session_path )
    end

    it "should be redirected to signin on new" do
      get :new
      expect( response ).to redirect_to( new_user_session_path )
    end

    it "should be redirected to signin on edit" do
	  user = User.create(:email => "alice@gmail.com", :first_name => "Alice", :last_name => "Adolfo", :birthday => Time.now, :gender => "M", :password => "aaaaaa")
      question = Question.create(:content => "5 plus 5 is?", :answer => "10", :user_id => user.id )

      get :show, params: {id: question.id}
      expect( response ).to redirect_to( new_user_session_path )
    end

    it "should be redirected to signin delete " do
	  user = User.create(:email => "alice@gmail.com", :first_name => "Alice", :last_name => "Adolfo", :birthday => Time.now, :gender => "M", :password => "aaaaaa")
      question = Question.create(:content => "5 plus 5 is?", :answer => "10", :user_id => user.id )

      get :show, params: {id: question.id}
      expect( response ).to redirect_to( new_user_session_path )
    end

    it "assigns @users on home page" do
      users = User.create(:email => "alice@gmail.com", :first_name => "Alice", :last_name => "Adolfo", :birthday => Time.now, :gender => "M", :password => "aaaaaa")
      get :home
      expect(assigns(:users)).to eq([users])
    end

    it "allows to see all the users on home page" do
      get :home
      expect( response ).to render_template( :home)
    end
  end
  


  describe "GET home" do
  	before :each do
      # This simulates an anonymous user
      login_with nil
    end

    it "assigns @users" do
      users = User.create(:email => "alice@gmail.com", :first_name => "Alice", :last_name => "Adolfo", :birthday => Time.now, :gender => "M", :password => "aaaaaa")
      get :home
      expect(assigns(:users)).to eq([users])
    end

    it "allows to see all the users" do
      get :home
      expect( response ).to render_template( :home)
    end
 end

end
