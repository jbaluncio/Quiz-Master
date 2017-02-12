class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :authenticate_user!

  def confirm_logged_in
  	unless current_user
  		flash[:notice] = "Please Log in."
  		redirect_to(new_user_session_path)
  	end	
  end
end
