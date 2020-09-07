class MenusController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    render "index"
  end

  def update
    $from_date = params[:from_date]
    $to_date = params[:to_date]
    $userorderitems = Order.all
    redirect_to viewer_index_path
  end
end
