class PostsController < ApplicationController

  def create
    Post.create(title: post_params[:title], content: post_params[:content], user_id: current_user.id, image: post_params[:image])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user)
  end

  def destroy
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.destroy
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.update(post_params)
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :image)
  end

end
