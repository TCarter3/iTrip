class AddressesController < ApplicationController
  before_action :set_location
  before_action :set_address, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_trip

  def show
  end

  def new
    @address = Address.new
  end

  def create
    @address = @location.create_address(address_params)

    if @address.save
      redirect_to trip_location_path(@trip, @location)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to trip_location_path(@trip, @location)
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to trip_location_path(@trip, @location)
  end

  private
    def set_location
      @location = Location.find(params[:location_id])
    end

    def address_params
      params.require(:address).permit(:street, :city, :state, :zip)
    end

    def set_address
      @address = @location.address
    end

    def set_trip
      @trip = Trip.find(@location.trip_id)
    end
end
