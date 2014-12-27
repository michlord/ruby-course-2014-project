class MoviesController < ApplicationController
  before_action :set_movie, only: [:show]
  
  def show
    @genres_list = @movie.genres
    @cast_list = @movie.casts
    @crew = @movie.crews.printable
    @crew_stub = {"Directing" => @crew["Directing"], "Writing" => @crew["Writing"]}.delete_if { |k, v| v.nil? }
    @release_dates = @movie.release_dates
  end
  
  private
    def set_movie
      @movie = Movie.find(params[:id])
    end
end
