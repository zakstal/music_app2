class TracksController < ApplicationController

  before_action :require_logged_in!

  def index
    @tack = Tracks.all
  end

  def new
    render :new
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to tracks_url(@track.id)
    else
      flash[:error] = ['Invalid track']
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    @track = Track.update(params[:id])
    redirect_to tracks_url(@track.id)
  end

  def destroy
    @track = Track.destroy(params[:id])
    redirect_to bands_ulr
  end

  def track_params
    params.require(:track).permit(:name, :track_type, :lyrics)
  end


end
