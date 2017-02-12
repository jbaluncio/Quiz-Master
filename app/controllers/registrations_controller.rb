# app/controllers/registrations_controller
class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :first_name, :last_name, :birthday, :gender)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :first_name, :last_name, :birthday, :gender)
  end
end