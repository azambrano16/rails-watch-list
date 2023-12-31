class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)
    if @list.save
      redirect_to @list, notice: 'List created🤪'
    else
      render 'new'
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def destroy
    @list = List.find(list_params)
    @list.destroy
    redirect_to @list, notice: 'list destoyed!'
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
