class ViewusersbyownerController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    render "index"
  end

  def show
    render "index"
  end

  def update
    id = params[:id]
    user = User.find(id)
    if !user.is_clerk
      user.role = "Clerk"
      user.is_clerk = true
    else
      user.role = "Customer"
      user.is_clerk = false
    end
    if user.save!
      flash[:notice] = "Details Changed Successfully"
      redirect_to viewusersbyowner_index_path
    end
  end

  def destroy
    id = params[:id]
    user = User.find(id)
    user.destroy
    redirect_to viewusersbyowner_index_path
  end
end
