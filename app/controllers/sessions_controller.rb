class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && (user.authenticate(params[:password]) && user.role == "Customer")
      session[:current_user_id] = user.id
      redirect_to usermain_index_path
    elsif user && (user.authenticate(params[:password]) && user.role == "Owner")
      session[:current_user_id] = user.id
      redirect_to ownerhome_index_path
    elsif user && (user.authenticate(params[:password]) && user.role == "Clerk")
      session[:current_user_id] = user.id
      redirect_to orderreceivedbyclerk_index_path
    else
      flash[:error] = "Invalid User Credentials.Please Login Again"
      redirect_to new_sessions_path
    end
  end

  def destroy
    Menuitem.delete_all
    Billitem.delete_all
    Orderitem.delete_all
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to "/"
  end
end
