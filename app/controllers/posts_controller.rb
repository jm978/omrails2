class PostsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = current_user.posts.new
  end

  # GET /posts/1/edit
  def edit
    @post = current_user.posts.find(params[:id])
  end

  # POST /posts
  def create
    @post = current_user.posts.new(post_params)

      if @post.save
        redirect_to @post, notice: 'Post was successfully created.' 
      else
        render :new
      end
  end

  # PATCH/PUT /posts/1
  def update
    @post = current_user.tweet.find(params[:id])
      if @post.update(post_params)
        redirect_to @post, notice: 'Post was successfully updated.' 
      else
        render :edit
      end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.' 
  end

  private
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content, :image)
    end
end
