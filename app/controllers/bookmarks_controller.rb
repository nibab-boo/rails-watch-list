class BookmarksController < ApplicationController
  before_action :find_list, except: [:destroy]

  def create
    # raise
    @bookmark = Bookmark.new(build_bookmark)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end
  
  def destroy
    @bookmark.destroy
  end
  private

  def build_bookmark
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def find_list
    @list = List.find(params[:list_id])
  end
end
