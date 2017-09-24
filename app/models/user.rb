class User < ApplicationRecord
  has_secure_password
  has_many :orders
  validates :email, uniqueness: true
  validates :first_name, :last_name, :email, presence: true
end
