class WelcomeController < ApplicationController

  def index
    @blogs = Blog.where(published: true, active: true)
  end

end
