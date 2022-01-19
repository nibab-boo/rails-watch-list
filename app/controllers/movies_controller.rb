class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @movies = Movie.all
  end
end
