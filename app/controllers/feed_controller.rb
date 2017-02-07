class FeedController < ApplicationController
	before_action :authenticate_user!
  
  def show
  	@posts = Post.where(user: current_user.all_following)
  end
end
