class UnitsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_location
  before_action :find_unit, only: [:show, :edit, :update, :destroy]

  def index
    @units = Unit.all
    @locations = Location.all
  end

  def show
  end

  def new
    @unit = Unit.new
  end

  def create
    @unit = @location.units.create unit_params
    if @unit.save == true 
    redirect_to location_path(@location)
    else 
    render :new
    end
  end

  def edit
  end

  def update
    @unit.update_attributes unit_params
    redirect_to location_path(@location)
  end

  def destroy
    @unit.delete
    redirect_to location_path(@location)
  end

  private
  def unit_params
    params.require(:unit).permit(:name, :date)
  end

  def find_location
    @location = Location.find params[:location_id]
  end

  def find_unit
    @unit = Unit.find params[:id]
  end
end
