class OrderreceivedbyclerkController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    render "index"
  end

  def show
    render "index"
  end

  def update
    id = params[:id]
    item = Order.find(id)
    if !item.confirmed
      item.confirmed = true
    else
      item.confirmed = false
    end
    item.save!
    redirect_to orderreceivedbyclerk_index_path
  end
end
