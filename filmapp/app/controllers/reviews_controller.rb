class ReviewsController < ApplicationController
  def page
    @reviews = Review.paginate(page: params[:page], per_page: 5)
    @movie = Movie.find(params[:movie_id])
    
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
