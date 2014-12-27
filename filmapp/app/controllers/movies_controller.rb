class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update]
  
  def index
    @movies = Movie.all
  end
  
  def show
    @genres_list = @movie.genres
    @cast_list = @movie.casts
    @crew = @movie.crews.printable
    @crew_stub = {"Directing" => @crew["Directing"], "Writing" => @crew["Writing"]}.delete_if { |k, v| v.nil? }
    @release_dates = @movie.release_dates
  end
  
  def edit
    
  end
  
  def update
    if @movie.update(movie_params)
      redirect_to movie_path(@movie), notice: 'Product was successfully updated.'
    else
      render action: 'edit'
    end
  end
  
  private
    def set_movie
      @movie = Movie.find(params[:id])
    end
    
    def movie_params
      params.require(:movie).permit(:title, :description, :webpage, :runtime, :poster)
    end
end
