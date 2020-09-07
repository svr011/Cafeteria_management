class OrdersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    @orderitemes = current_user.orders
    @userrole = current_user.role
    render "index"
  end

  def show
    id = params[:id]
    order = Order.of_user(current_user).find(id)
    render "order"
  end

  def create
    items = Billitem.all
    items.each do |item|
      name = item.item_name
      cost = item.item_cost
      quantity = item.quantity
      t = Time.now
      ordereditems = Order.create(delivered_at: nil,
                                  confirmed: false,
                                  quantity: quantity,
                                  item_name: name,
                                  item_cost: item.item_cost,
                                  order_time: item.ordertime,
                                  user_id: current_user.id)
    end
    Billitem.delete_all
    Orderitem.delete_all
    redirect_to billitems_path
  end

  def update
    id = params[:id]
    item = Order.find(id)
    if !item.confirmed
      item.confirmed = true
    else
      item.confirmed = false
    end
    item.delivered_at = Time.now
    item.save!
    redirect_to orderreceived_index_path
  end
end
