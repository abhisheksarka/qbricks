class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
  end

  def update
    super
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :full_name, :phone_number, :password, :password_confirmation, :country_code)
  end
end
