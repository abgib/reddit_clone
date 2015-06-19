class PostsController < ApplicationController
  before_action :require_user

  def new
    @post = Post.new
    render :new
  end

  def create

    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.sub_id = params[:sub_id]

    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(
            :title,
            :author_id,
            :sub_id,
            :url,
            :content
            )
  end

end
