class UsersController < ApplicationController

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = user.errors.full_messages
      redirect_to edit_user_path(user)
    end
  end

  def login
  end


  def admin
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :firstname, :lastname)
  end

end
