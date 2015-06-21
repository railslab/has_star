class PostsController < ApplicationController
  has_star :resource
  before_action -> { sleep 0.25 }, only: :toggle_star

  def resource
    Post.find params[:id]
  end

  def starred
    @posts = Post.starred
    render :index
  end

  def unstarred
    @posts = Post.unstarred
    render :index
  end

  def index
    @posts = Post.all
  end
end
