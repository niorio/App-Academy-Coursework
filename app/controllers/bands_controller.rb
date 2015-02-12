class BandsController < ApplicationController
  before_action :must_be_signed_in

  def index
    @bands = Band.all
    render :index
  end


  def new
    @band = Band.new
    render :new
  end

  def show
    @band= Band.find_by(id: params[:id])
    render :show
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band.id)
    else
      render :new
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_url
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      redirect_to band_url(@band.id)
    else
      render :edit
    end
  end



  private
  def band_params
    params.require(:band).permit(:name)
  end

end
