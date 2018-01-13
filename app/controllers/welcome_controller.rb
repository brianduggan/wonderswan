class WelcomeController < ApplicationController

  def index
    @blogs = Blog.where(published: true, active: true)
    @user = User.new
  end

end
