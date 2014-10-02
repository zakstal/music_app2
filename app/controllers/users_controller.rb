class UsersController < ApplicationController
  # before_action :require_logged_in!, only: [:destroy]
  # before_action :require_logged_out!, only: [:new, :create]
  def index
    @users = User.all
  end

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in!(@user)
      redirect_to users_url
    else
      flash[:error] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
