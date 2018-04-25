class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(list_id)
  end

  def new
    @list = List.new()
  end

  def create
    @list = List.new(list_params)
    if @list.save()
      redirect_to @list
    else
      render 'new'
    end
  end

  def edit
    @list = List.find(list_id)
  end

  def destroy
    @list = List.find(list_id)
    if @list.destroy
      redirect_to lists_path
    end
  end

  def update
    @list = List.find(list_id)
    if @list.update(list_params)
      redirect_to @list
    else
      render 'edit'
    end
  end

  private
  def list_params
    params.require(:list).permit(:title, :description)
  end

  def list_id
    params[:id]
  end
end
