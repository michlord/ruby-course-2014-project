class ReviewsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :new]
  def page
    @movie = Movie.find(params[:movie_id])
    @reviews = @movie.reviews.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build()
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build(params.require(:review).permit(:headline, :content).merge(user: current_user))
    if @review.save
      redirect_to movie_path(@movie), notice: "Review was successfully created."
    else
      render action: "new"
    end
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
