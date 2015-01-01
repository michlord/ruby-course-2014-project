class ReviewsController < ApplicationController
  def page
    @movie = Movie.find(params[:movie_id])
    @reviews = @movie.reviews.paginate(page: params[:page], per_page: 5)
  end
  
  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
