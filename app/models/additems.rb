class Additems < ActiveRecord::Base
  validates :item_name, presence: true
  validates :item_description, length: { minimum: 2 }
  validates :item_cost, presence: true
  def self.check_breakfast
    all.where(menu_id: 1)
  end
  def self.check_lunch
    all.where(menu_id: 2)
  end
  def self.check_dinner
    all.where(is_dinner: true)
  end
end
