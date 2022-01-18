class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(build_list)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def build_list
    params.require(:list).permit(:name, :photo)
  end
end
