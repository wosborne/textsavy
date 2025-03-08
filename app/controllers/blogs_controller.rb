class BlogsController < ApplicationController
  def edit
    @blog = current_user.blog
  end

  def update
    if current_user.blog.update(user_params)
      redirect_to posts_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @blog = Blog.new
  end

  def create
    # redirect to root_path if blog already exists
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
end
