class BlogsController < ApplicationController

  def index
    @blogs = Blog.where(user_id: current_user.id, active: true).order(created_at: :desc)
  end

  def new
    @user = current_user
    @blog = Blog.new
  end

  def create
    blog = Blog.create(blog_params)
    blog.update({user_id: current_user.id})
    if !blog.save
      flash[:error] = blog.errors.full_messages
    else
      redirect_to user_blog_path(current_user, blog)
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
    @blog.tag_list = @blog.tag_list.map{|tag| tag}.join(', ')
  end

  def update
    blog = Blog.find(params[:id])
    blog.update_attributes(blog_params)
    redirect_to user_blog_path(current_user, blog)
  end

  def publish
    blog = Blog.find(params[:id])
    blog.update({published: true})
    redirect_to root_path
  end

  def unpublish
    blog = Blog.find(params[:id])
    blog.update({published: false})
    redirect_to user_blogs_path
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.update({active: false, published: false})
    redirect_to user_blogs_path
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body, :published, :active, :tag_list)
  end

end
