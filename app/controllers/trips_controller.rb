class TripsController < ApplicationController
  before_action :set_trips, only: [:show, :edit, :update, :destroy]


  def index
    @trips = current_user.trips
  end

  def show
  end

  def new
    @trip = Trip.new()
  end

  def create
    @trip = current_user.trips.new(trip_params)
    if @trip.update
      redirect_to @trip
    else render :new
    end
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      redirect_to @trip
    else 
      render :edit
    end
  end

  def destroy 
    @trip.destroy
    redirect_to trips_path
  end

  private

  def set_trips
    @trip = current_user.trips.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:name, :start_date, :end_date)
  end

end
