class UsersController < ApplicationController
  before_action :login_user, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "You register successfully"
      redirect_to :root
    else
      flash[:notice] = "Something went wrong with your registration"
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
