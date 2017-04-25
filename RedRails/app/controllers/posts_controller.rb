class PostsController < ApplicationController
  before_action :require_login, except: :show

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.post_subs = params[:sub_ids]
    @post.author = current_user
    fail
    if @post.save
      redirect_to sub_post_url(sub_id: params[:sub_id], id: @post.id)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def update
    @post = the_post
    @post.assign_attributes(post_params)
    if @post.valid? && current_user.id == @post.author_id
      @post.save
      redirect_to sub_url(@post.sub_id)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def edit
    @post = the_post
  end

  def destroy
    @post = the_post
    top_sub = @post.sub_id
    if current_user && @post
      @post.destroy
      redirect_to sub_url(top_sub)
    else
      redirect_to sub_url(top_sub)
    end
  end

  def show
    @post = the_post
  end

  def the_post
    post = Post.find_by(id: params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
