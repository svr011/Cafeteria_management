class AdditemsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    render "index"
  end

  def show
  end

  def create
    item_name = params[:item_name]
    item_description = params[:item_description]
    item_cost = params[:item_cost]
    menutype = params[:menutype]
    is_breakfast = false
    is_lunch = false
    is_dinner = false
    if menutype == "Breakfast"
      menuid = 1
      is_breakfast = true
    end
    if menutype == "Lunch"
      menuid = 2
      is_lunch = true
    end
    if menutype == "Dinner"
      menuid = 3
      is_dinner = true
    end
    new_item = Additems.new(item_name: item_name,
                            item_description: item_description,
                            item_cost: item_cost,
                            user_id: 1,
                            menu_id: menuid,
                            is_breakfast: is_breakfast,
                            is_lunch: is_lunch,
                            is_dinner: is_dinner)

    if new_item.save
      flash[:notice] = " Item Entry Successful "
      redirect_to additems_path
    else
      flash[:error] = new_item.errors.full_messages.join(" , ")
      redirect_to additems_path
    end
  end

  def edit
    @item = Additems.find(params[:id])
    render "edit"
  end

  def update
    @item = Additems.find(params[:id])
    @item.item_name = params[:additems][:item_name]
    @item.item_description = params[:additems][:item_description]
    @item.item_cost = params[:additems][:item_cost]
    if @item.save
      redirect_to additems_path
    else
      flash[:error] = @item.errors.full_messages.join(" , ")
      render "edit"
    end
  end

  def item_params
    params.fetch(:item, {}).permit(:item_name, :item_description => [])
  end

  def destroy
    id = params[:id]
    item = Additems.find(id)
    item.destroy
    redirect_to additems_path
  end
end
