class PostsController < ApplicationController
  has_star :resource

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
