class UsersController < ApplicationController
  before_action :require_logged_in!, only: [:destroy]
  before_action :require_logged_out!, only: [:new, :create]

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in!
      redirect_to user_url(@user)
    else
      flash[:error] = @user.errors.full_messages
      render :new
  end

  def show
    @user = User.find(user_params)
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end