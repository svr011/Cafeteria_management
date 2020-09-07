class MenuitemsController < ApplicationController
  def index
    render "index"
  end

  def create
    @count1 = 0
    menutypes = params[:menu]
    if menutypes == "Breakfast"
      items = Additems.check_breakfast
    end
    if menutypes == "Lunch"
      items = Additems.check_lunch
    end
    if menutypes == "Dinner"
      items = Additems.check_dinner
    end
    items.each do |item|
      item_name = item.item_name
      item_description = item.item_description
      item_cost = item.item_cost
      if items.count != Menuitem.count
        menu_item = Menuitem.new(item_name: item_name,
                                 item_description: item_description,
                                 item_cost: item_cost,
                                 user_id: 1,
                                 selected: false)

        item.save
        if menu_item.save
          @count1 = @count1 + 1
        end
      end
    end
    redirect_to menuitems_path
  end

  def update
    id = params[:id]
    selected = params[:selected]
    item = Menuitem.find(id)
    if !item.selected
      item.selected = true
    else
      item.selected = false
    end
    if item.save! && item.selected
      flash[:error] = "Item Successfully Selected to Order"
      redirect_to menuitems_path
    elsif !item.selected
      flash[:error] = "You Deselected an Item"
      redirect_to menuitems_path
    end
  end

  def destroy
    id = params[:id]
    item = Menuitem.find(id)
    item.destroy
    redirect_to orderitems_path
  end
end
