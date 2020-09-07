class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_pleasant_string
  end

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    password = params[:password]

    created_user = User.new(first_name: first_name,
                            last_name: last_name,
                            email: email,
                            role: "Customer",
                            is_owner: false,
                            is_clerk: false,
                            password: password)
    if created_user.save
      flash[:error] = "User Successfully Registered"
      redirect_to "/"
    else
      flash[:error] = created_user.errors.full_messages.join(" , ")
      redirect_to user_sessions_path
    end
  end

  def update
    id = params[:id]
    user = User.find(id)
    if !user.is_owner
      user.role = "Owner"
      user.is_owner = true
    else
      user.role = "Customer"
      user.is_owner = false
    end
    if user.save!
      flash[:notice] = "Details Changed Successfully"
      redirect_to viewusersbyowner_index_path
    end
  end

  def login
    check_email = params[:email]
    check_password = params[:password]
    check_role = "Customer"
    if (User.where(["email = ? and password = ?", check_email, check_password]).exists?)
      render plain: "true"
    else
      render plain: "false"
    end
  end

  def edit
    id = params[:id]
  end
end
