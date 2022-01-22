class MoviesController < ApplicationController
  before_action :find_movie, only: [:show]

  def show
    @new_movie = Movie.new
    @movies = Movie.all
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    @movie = Movie.new(build_movie)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render "bookmarks/show"
    end
  end

  private

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def build_movie
    params.require(:movie).permit(:title, :overview, :rating, :poster_url)
  end
end
