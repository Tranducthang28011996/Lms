class SessionsController < ApplicationController
  before_action :login_user, only: [:new, :create]

  def new
  end

  def create
  	authorized_user = User.authenticate(params[:username_or_email], params[:password])

    if authorized_user
      session[:current_user_id] = authorized_user.id

      flash[:notice] = "Welcome to the LMS"
      redirect_to root_path
    else
      flash[:notice] = "Invalid Username or Password"
      render :new
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to login_path
  end
end
