class AddressesController < ApplicationController
  before_action :set_location
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index 
    @addresses = @location.addresses.all
  end

  def show
  end

  def new
    @address = Adress.new
  end

  def create
    @address = Adress.new(address_params)

    if @address.save
      redirect_to location_address_path(@location, @adress)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to location_address_path(@location, @adress)
    else
      render :edit
    end
  end

  def destroy
    @adress.destroy
    redirect_to location_addresses_path(@location)
  end

  private
    def set_location
      @location = Location.find(params[:location_id])
    end

    def address_params
      require.params(:address).permit(:street, :city, :state, :zip)
    end

    def set_address
      @address = Adress.find(params[:id])
    end
end
