class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:post_id])
  end

  def new
  end

  def create
    post = Post.create(title:params[:title],content:params[:content])
    redirect_to "/"
  end

  def edit
    @post = Post.find(params[:post_id])
  end

  def update
    post = Post.find(params[:post_id])
    post.title = params[:title]
    post.content = params[:content]
    post.save
    redirect_to "/"
  end

  def delete
    post = Post.find(params[:post_id])
    post.destroy
    redirect_to "/"
  end
end
