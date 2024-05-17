PASSWORD_REQUIREMENTS = {
  :eight_characters => {
    :pattern => /\A(?=.{8,})/x,
    :error_message => "Must contain atleast 8 characters"
  },
  :atleast_one_number => {
    :pattern => /\A(?=.*\d)/x,
    :error_message => "Must contain atleast one number"
  },
  :atleast_one_lowercase => {
    :pattern => /\A(?=.*[a-z])/x,
    :error_message => "Must contain atleast one lowercase letter",
  },
  :atleast_one_upprecase => {
    :pattern => /\A(?=.*[A-Z])/x,
    :error_message => "Must contain atleast one uppercase letter"
  }, 
  :atleast_one_symbol => {
    :pattern => /\A(?=.*[[:^alnum:]])/x,
    :error_message => "Must contain at least one symbol"
  }
}

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
      errors = {
        :password => []
      }
      PASSWORD_REQUIREMENTSS.each do |key, value|
        if !value[:pattern].match(user_params[:password])
          errors[:password].push(value[:error_message])
        end
      end
      if !errors[:password].empty?
        render json: { errors: errors}, status: :bad_request
      end
    end

  
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end