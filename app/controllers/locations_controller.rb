class LocationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_location, only: [:show, :edit, :update, :destroy]  
  def index
    @locations = Location.all
  end

  def show
  end

  def new
    @location = Location.new
  end

  def create
    authorize! :create, @location
    @location = Location.create location_params
    if @location.save == true
    redirect_to locations_path
    else
    render :new
    end
  end

  def edit
  end

  def update
    authorize! :update, @location
    @location.update_attributes location_params
    redirect_to locations_path(@location)
  end

  def destroy
    authorize! :destroy, @location
    @location.delete
    redirect_to locations_path(@locations)
  end

  private
  def find_location
    @location = Location.find params[:id]
  end

  def location_params
    params.require(:location).permit(:location_name)
  end

end
