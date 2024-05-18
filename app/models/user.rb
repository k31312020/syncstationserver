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

class PasswordValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      errors = []
      PASSWORD_REQUIREMENTS.each do |key, val|
        unless val[:pattern].match?(value)
            record.errors.add attribute, (val[:error_message])
        end
      end
    end
end

class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true, format: {with: EMAIL_REGEX, message: "Invalid Email Address"}
    validates :password, :password_confirmation, presence: true
    validates :password, password: true
end
