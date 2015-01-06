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
    if params[:add_genre]
      @movie.genres.build
      render action: 'edit'
    elsif params[:remove_genre]
      #nested_attributes automatically removes the genre
      render action: 'edit'
    elsif params[:add_crew]
      @movie.crews.build
      render action: 'edit'
    elsif params[:remove_crew]
      render action: 'edit'
    elsif params[:add_cast]
      cast = @movie.casts.build
      cast.build_actor
      render action: 'edit'
    elsif params[:remove_cast]
      render action: 'edit'
    elsif params[:add_release_date]
      @movie.release_dates.build
      render action: 'edit'
    elsif params[:remove_release_date]
      render action: 'edit'
    else
      if @movie.update(movie_params)
        redirect_to movie_path(@movie), notice: 'Movie was successfully updated.'
      else
        render action: 'edit'
      end
    end
  end
  
  def destroy
    @movie.destroy
  end
  
  def new
    @movie = Movie.new
  end
  
  def create
    @movie = Movie.new(movie_params)
    if params[:add_genre]
      @movie.genres.build
      render action: 'new'
    elsif params[:remove_genre]
      #nested_attributes automatically removes the genre
      render action: 'new'
    elsif params[:add_crew]
      @movie.crews.build
      render action: 'new'
    elsif params[:remove_crew]
      render action: 'new'
    elsif params[:add_cast]
      cast = @movie.casts.build
      cast.build_actor
      render action: 'new'
    elsif params[:remove_cast]
      render action: 'new'
    elsif params[:add_release_date]
      @movie.release_dates.build
      render action: 'new'
    elsif params[:remove_release_date]
      render action: 'new'
    else
      if @movie.save
        redirect_to movie_path(@movie), notice: 'Movie was successfully created.'
      else
        render action: 'new'
      end
    end
  end
  
  private
    def set_movie
      @movie = Movie.find(params[:id])
    end
    
    def movie_params
      params.require(:movie).permit(
        :title, :description, :webpage, :runtime, :poster, :language,
        genres_attributes: [:id, :name, :_destroy],
        crews_attributes: [:id, :name, :function, :role, :_destroy],
        casts_attributes: [:id, :character, :_destroy, actor_attributes: [:id, :name, :_destroy]],
        release_dates_attributes: [:id, :date, :country, :_destroy]
      )
    end
end
