class ApplicationRecord < ActiveRecord::Base
  EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\z/
  primary_abstract_class
end
