class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @review = Review.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @review = @artist.reviews.new(review_params)
    if @review.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def destroy
    @artist = Artist.find(params[:artist_id])
    review = Review.find(params[:id])
    review.destroy
    redirect_to artist_path(@artist)
  end

private
  def review_params
    params.require(:review).permit(:author, :content)
  end
end
