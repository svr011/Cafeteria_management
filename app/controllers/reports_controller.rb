class ReportsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    render "index"
  end

  def edit
    id = params[:id]
    @user = User.find(id)
    render "singlepersonreport"
  end

  def update
    id = params[:id]
    $user = User.find(id)
    $from_date = params[:from_date]
    $to_date = params[:to_date]
    $userorderitems = $user.orders
    redirect_to viewer_index_path
  end

  def dateview
  end
end
