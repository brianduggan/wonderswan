class SessionsController < ApplicationController
  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    elsif user && !user.authenticate(params[:password])
      flash[:error] = 'Sorry, incorrect password'
      flash[:action] = 'Log In'
      redirect_to :back
    else
      flash[:error] = 'Sorry, this username does not exist'
      flash[:action] = 'Log In'
      redirect_to :back
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
