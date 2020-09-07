class OrderitemsController < ApplicationController
  def index
    render "index"
  end

  def create
    items = Menuitem.all
    items.each do |item|
      if item.selected
        item_name = item.item_name
        item_cost = item.item_cost
        quantity = params[:quantity]
        menu_item = Orderitem.create(ordered_user_id: 1,
                                     menu_item_name: item_name,
                                     menu_item_cost: item_cost,
                                     quantity: 1)

        item.selected = false
      end
    end
    redirect_to orderitems_path
  end

  def edit
    @item = Orderitem.find(params[:id])
    render "edit"
  end

  def new
    render "index"
  end

  def update
    @item = Orderitem.find(params[:id])
    @item.quantity = params[:orderitem][:quantity]
    if @item.save
      redirect_to orderitems_path
      flash[:notice] = "Quantity Updated"
    else
      flash[:error] = "Order details are not updated "
      render "edit"
    end
  end

  def destroy
    id = params[:id]
    item = Orderitem.find(id)
    item.destroy
    redirect_to orderitems_path
  end
end
