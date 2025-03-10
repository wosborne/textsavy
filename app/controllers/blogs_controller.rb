class BlogsController < ApplicationController
  before_action :redirect_if_blog_already_exists, only: %i[new create]

  def edit
    @blog = current_blog
  end

  def update
    if current_blog.update(user_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(user_params)
    @blog.user = current_user

    if @blog.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:blog).permit(:title, :description)
  end

  def redirect_if_blog_already_exists
    redirect_to root_path if current_blog.present?
  end
end
