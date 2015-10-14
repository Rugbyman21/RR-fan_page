class MembersController < ApplicationController
  def new
    @artist = Artist.find(params[:artist_id])
    @member = Member.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @member = @artist.members.new(member_params)
    if @member.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def show
    @artist = Artist.find(params[:artist_id])
    @member = Member.find(params[:id])
  end

  def destroy
    member = Member.find(params[:id])
    @artist = Artist.find(params[:artist_id])
    member.destroy
    redirect_to artist_path(@artist)
  end

  def edit
    @member = Member.find(params[:id])
    @artist = Artist.find(params[:artist_id])
  end

  def update
    @member = Member.find(params[:id])
    @artist = Artist.find(params[:artist_id])
    if @member.update(member_params)
      redirect_to artist_member_path(@artist, @member)
    else
      render :edit
    end
  end

private
  def member_params
    params.require(:member).permit(:first_name, :last_name, :instrument, :age, :time_in_band)
  end
end
