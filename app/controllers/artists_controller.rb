class ArtistsController < ApplicationController
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

private
  def artist_params
    params.require(:artist).permit(:name)
  end
end
