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
    url = "http://www.omdbapi.com/?t=#{params[:movie][:title]}&apikey=bfd83e6e"
    # https://imdb-api.com/API/SearchMovie/k_j2w9qy6i/
    response = URI.open(url).read
    data = JSON.parse(response)
    @movie = Movie.new(
      title: data["Title"],
      overview: data["Plot"],
      rating: data["imdbRating"],
      poster_url: data["Poster"]
    )
    # raise
    authorize @movie
    if @movie.save
      # raise
      respond_to do |format|
        format.html { redirect_to movies_path }
        format.text { render partial: 'movies/flip_card.html.erb', locals: { movie: @movie }, formats: [:html] }
      end
    else
      render :index
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
