class MoviesController < ApplicationController
  before_action :find_movie, only: [:show]

  def show
    @new_movie = Movie.new
    @movies = Movie.all
  end

  def create
    # raise
    @new_movie = Movie.new(build_movie)
    if @new_movie.save
      redirect_to movie_path(@new_movie)
    else
      render 'movies/show'
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
