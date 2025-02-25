class PostsController < ApplicationController
  allow_unauthenticated_access only: :index
  def index
    @posts = Post.all
  end
end