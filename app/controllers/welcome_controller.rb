class WelcomeController < ApplicationController

  def index
    if params[:tag]
        @blogs = Blog.where(published: true, active: true).tagged_with(params[:tag])
    else
        @blogs = Blog.where(published: true, active: true)
    end
  end

end
