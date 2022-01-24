require 'open-uri'

class MoviesController < ApplicationController
  before_action :find_movie, only: [:destroy]
  
  def index
    @movies = Movie.all
    @movie = Movie.new
  end

  def new
  end

  def create
    url = "http://www.omdbapi.com/?t=#{params[:movie][:title]}&apikey=bfd83e6e"
    response = URI.open(url).read
    data = JSON.parse(response)
    @movie = Movie.new(
      title: data["Title"],
      overview: data["Plot"],
      rating: data["imdbRating"],
      poster_url: data["Poster"]
    )
    if @movie.save
      redirect_to movies_path
    end
    render :new
  end

  def destroy

  end
 
  private

  def find_movie
    @movie = Movie.find(params[:id])
  end

  # def build_movie
  #   params.require(:movie).permit(:title, :overview, :rating, :poster_url)
  # end
end
