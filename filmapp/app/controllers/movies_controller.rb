class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  
  before_filter :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
  before_filter only: [:create, :new, :edit, :update, :destroy] do 
    redirect_to root_url, :alert => 'Admin permissions are needed.' unless current_user.try(:admin?)
  end
  
  def index
    @movies = Movie.limit(9)
    @genres = Genre.limit(9)
  end
  
  def show
    @genres_list = @movie.genres
    @cast_list = @movie.casts
    @crew = @movie.crews.printable
    @crew_stub = {"Directing" => @crew["Directing"], "Writing" => @crew["Writing"]}.delete_if { |k, v| v.nil? }
    @release_dates = @movie.release_dates
    @review = @movie.reviews.random
  end
  
  
  def edit
    
  end
  
  def update
    if @movie.update(movie_params)
      redirect_to movie_path(@movie), notice: 'Movie was successfully updated.'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @movie.destroy
  end
  
  private
    def set_movie
      @movie = Movie.find(params[:id])
    end
    
    def movie_params
      params.require(:movie).permit(:title, :description, :webpage, :runtime, :poster)
    end
end
