class VotesController < ApplicationController
  before_action :authenticate_user!
  def create
    post = Post.find(params[:id])
    post.liked_by current_user
    redirect_to posts_path, notice: "You successfully liked this post"
  end

  def destroy
    post = Post.find(params[:id])
    post.unliked_by current_user
    redirect_to posts_path, notice: "You successfully unliked this post"


  end
end
