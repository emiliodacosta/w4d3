class SessionsController < ApplicationController
  before_action :ensure_logged_in

  def new
    #why are we rewriting the new action from User Controller
    @user = User.new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if user
      login_user!(user)
      redirect_to cats_url
    else
      flash.now[:errors] = ['Invalid username and password combination']
      #needs to add a new user because new is expecting a new user instance variable
      render :new, status: 422
    end
  end

  def destroy
    if current_user
      logout!
    end

    redirect_to cats_url
  end
end
