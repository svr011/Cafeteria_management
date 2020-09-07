class UsermainController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    render "index"
  end

  def edit
    id = params[:id]
    @user = User.find(id)
    @from_date = params[:from_date]
    @to_date = params[:to_date]
    render :template => "reports/reportstats"
  end

  def new
    redirect_to usermain_path
  end
end
