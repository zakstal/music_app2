class SessionsController < ApplicationController
  before_action :require_logged_in!, only: [:destroy]
  before_action :require_logged_out!, only: [:new, :create]
  def new
    redirect :new
  end

  def create
    @user = User.find_by_credentials(
      param[:user][:email],
      param[:user][:password]
    )

    if @user.nil?
      flash[:errors] = ["Wrong user name or password"]
      render :new
    else
      log_in!(@user)
      redirect_to user_url(@user)
  end

  def destroy
    log_out!
  end

end
