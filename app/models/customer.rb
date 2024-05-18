class Customer < ApplicationRecord
    validates :firstname, :lastname, :email, :phone, :street, :state, :city, :zip, presence: true
    validates :firstname, length: {minimum: 2}
    validates :email, uniqueness: true
    validates :email, format: {with: EMAIL_REGEX, message: "Invalid email address"}
end
