require 'open-uri'

class MoviesController < ApplicationController
  before_action :find_movie, only: [:destroy]
  
  def index
    # @movies = Movie.order(id: :desc)
    @movie = Movie.new
    @movies = policy_scope(Movie).order(id: :desc)
  end

  def new
  end

  def create
    url = "http://www.omdbapi.com/?i=#{params[:movie][:id]}&apikey=bfd83e6e"
    response = URI.open(url).read
    data = JSON.parse(response)
    @movie = Movie.new(
      title: data["Title"],
      overview: data["Plot"],
      rating: data["imdbRating"],
      poster_url: data["Poster"]
    )
    # raise
    @movies = Movie.all
    authorize @movie
    if @movie.save
      # raise
      respond_to do |format|
        format.html { redirect_to movies_path }
        format.js 
      end
    else
      respond_to do |format|
        format.html { render :index }
        format.js
      end
    end
  end

  def destroy; end
 
  private

  def find_movie
    @movie = Movie.find(params[:id])
  end

  # def build_movie
  #   params.require(:movie).permit(:title, :overview, :rating, :poster_url)
  # end
end
