class Menu < ActiveRecord::Base
  validates :from_date, presence: true
  validates :to_date, presence: true
  has_many :menu_items
end
