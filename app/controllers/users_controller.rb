PASSWORD_REQUIREMENTS = /\A
    (?=.{8,}) # At least 8 characters long
    (?=.*\d) # Contain at least one number
    (?=.*[a-z]) # Contain at least one lowercase letter
    (?=.*[A-Z]) # Contain at least one uppercase letter
    (?=.*[[:^alnum:]]) # Contain at least one symbol
/x

class UsersController < ApplicationController
  before_action :validate_password, only: [:create]
  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors }, status: :unprocessable_entity
    end
  end

  private

    def validate_password
      if !PASSWORD_REQUIREMENTS.match(user_params[:password])
        render json: { errors: "bad password"}, status: :bad_request
      end
    end

  
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end