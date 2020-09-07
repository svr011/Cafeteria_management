class BillitemsController < ApplicationController
  def index
    render "index"
  end

  def create
    ordereditems = Orderitem.all
    ordereditems.each do |item|
      item_name = item.menu_item_name
      item_cost = item.menu_item_cost
      item_quantity = item.quantity
      menu_item = Billitem.create(item_name: item_name,
                                  item_cost: item_cost,
                                  ordertime: Time.now,
                                  user_id: 1,
                                  quantity: item_quantity)

      item.save
    end
    if Billitem.count >= Orderitem.count
      flash[:error] = "Processing  your order.Check Status for details"
      redirect_to billitems_path
    end
    Orderitem.delete_all
  end

  def new
    redirect_to orderitems_path
  end
end
