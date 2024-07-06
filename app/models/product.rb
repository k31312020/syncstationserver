class Product < ApplicationRecord
  belongs_to :user
  validates :name :code :description :short :stock presence: true
end
