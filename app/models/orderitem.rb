class Orderitem < ActiveRecord::Base
  validates :menu_item_cost, presence: true

  def index
    render "index"
  end
end
