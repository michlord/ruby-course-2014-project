class MoviesController < ApplicationController
  before_action :set_movie, only: [:show]
  
  def show
    @genres_list = @movie.genres
  end
  
  private
    def set_movie
      @movie = Movie.find(params[:id])
    end
end
