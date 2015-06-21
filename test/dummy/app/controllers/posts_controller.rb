class PostsController < ApplicationController
  has_star

  def resource
    @post = Post.find params[:id]
  end

  def starred
    @posts = Post.starred
    render :index
  end

  def unstarred
    @posts = Post.unstarred
    render :index
  end

  before_action -> { sleep 0.5 }, only: :toggle_star

  def index
    @posts = Post.all
  end
end
