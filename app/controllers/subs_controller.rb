class SubsController < ApplicationController

  def index
    @subs = Sub.all
    render :index
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def new
    @sub = Sub.new
    render :new
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])

    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :edit
    end

  end

  def destroy
    @sub = Sub.find(params[:id])

    if current_user.id != @sub.moderator_id
      redirect_to user_url(current_user)
      flash[:errors] = ["Do not moderate sub"]
    else
      @sub.destroy
      redirect_to user_url(current_user)
    end

  end


  private
    def sub_params
      params.require(:sub).permit(:title, :description, :moderator_id)
    end
end
