class PostsController < ApplicationController
  allow_unauthenticated_access only: %w[index show]
  before_action :set_post, only: %w[show edit update destroy]
  before_action :protect_archived_post, only: %w[show]

  def index
    @posts = get_posts.order(created_at: :desc).with_rich_text_content
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_path(@post), notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update

    if @post.update(post_params)
      redirect_to post_path(@post), notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy

    redirect_to posts_path, notice: "Post was successfully destroyed."
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :archived)
  end

  def filter_params
    params.permit(filter: [ :archived ])
  end

  def get_posts
    current_user ? Post.where(filter_params[:filter]) : Post.where(archived: false)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def protect_archived_post
    return unless @post.archived?

    require_authentication
  end
end
