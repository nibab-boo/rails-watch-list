class ListsController < ApplicationController
  before_action :find_list, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # @lists = List.all
    @lists = policy_scope(List)
    # @restaurants = policy_scope(Restaurant)
  end

  def show
    @bookmark = Bookmark.new
    @movies = Movie.all
    @still_movies = @list.non_existence_movies
  end

  def new
    @list = List.new
    authorize @list
  end

  def create
    @list = List.new(build_list)
    @list.user = current_user
    authorize @list
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    if @list.destroy
      redirect_to root_path     
   else
      redirect_to list_path(@list)
   end
  end

  private

  def find_list
    @list = List.find(params[:id])
    authorize @list
  end

  def build_list
    params.require(:list).permit(:name, :photo)
  end
end
