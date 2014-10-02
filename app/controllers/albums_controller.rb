class AlbumsController < ApplicationController

  before_action :require_logged_in!, only: [:show]


  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Albums.new(album_params)

    if @album.save
      redirect_to albums_url(@album.id)
    else
      flash[:errors] = @album.erros.full_messeges
      render :new
    end
  end

  def edit
    render :edit
  end

  def show
    @album = @album.find(params[:id])
    render :show
  end

  def update
    @album = Albums.find(parmas[:id]).update
    redirect_to albums_url(@album.id)
  end

  def destroy
    Albums.find(params[:id]).destroy
  end

  def album_params
    params.require(:album).permit(:name, :session)
  end
end
