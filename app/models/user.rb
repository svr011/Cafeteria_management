class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :email, presence: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  validates :first_name, length: { maximum: 26 }
  validates :first_name, length: { minimum: 3 }
  has_secure_password
  has_many :orders
end
