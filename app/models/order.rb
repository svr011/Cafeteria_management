class Order < ActiveRecord::Base
  validates :order_time, presence: true
  belongs_to :user
  def self.of_user(user)
    all.where(user_id: user.id)
  end
end
