class Report < ActiveRecord::Base
  validates :from_date, presence: true
  validates :to_date, presence: true
  validates :menu_item_cost, presence: true
end
