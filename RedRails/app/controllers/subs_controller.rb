class SubsController < ApplicationController
  before_action :require_login, except: [:index, :show]

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def new
    render :new
  end

  def edit
    @sub = Sub.find_by(id: params[:id])
    render :edit
  end

  def update
    @sub = Sub.find_by(id: params[:id])
    @sub.assign_attributes(sub_params)
    if @sub.user_id == current_user.id && @sub.valid?
      @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render edit_sub_url(@sub)
    end
  end

  def show
    @sub = Sub.find_by(id: params[:id])
    render :show
  end

  def index
    render :index
  end

  def destroy
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
