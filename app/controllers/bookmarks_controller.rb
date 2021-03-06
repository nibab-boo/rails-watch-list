class BookmarksController < ApplicationController
  before_action :find_list, except: [:destroy, :show]


  def show
    @bookmark = Bookmark.find(params[:id])
  end


  def create
    # raise 
    @movie = Movie.find(params["bookmark"]["movie_id"].to_i)
    @movies = Movie.all
    @still_movies = @list.non_existence_movies
    @bookmark = Bookmark.new(build_bookmark)
    @bookmark.list = @list

    authorize @bookmark
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render 'lists/show'
    end
  end
  
  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(list)
  end
  private

  def build_bookmark
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def find_list
    @list = List.find(params[:list_id])
  end
end
