class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def new
    @genre = Genre.find(params[:genre_id])
    @artist = @genre.artists.new
  end

  def create
    @genre = Genre.find(params[:genre_id])
    @artist = @genre.artists.new(artist_params)
    if @artist.save
      redirect_to genre_path(@artist.genre)
    else
      render :new
    end
  end

  def show
    @artist = Artist.find(params[:id])
    @genre = @artist.genre
  end

  def destroy
    artist = Artist.find(params[:id])
    @genre = artist.genre
    artist.members.each do |member|
      member.destroy
    end
    artist.reviews.each do |review|
      review.destroy
    end
    artist.destroy
    redirect_to genre_path(@genre)
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to artist_path(@artist)
    else
      render :edit
    end
  end

private
  def artist_params
    params.require(:artist).permit(:name)
  end
end
