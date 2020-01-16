class TripsController < ApplicationController
  before_action :check_if_logged_in

  def index
    @path = 'trips'
    @trips = Trip.where(user_id: @current_user.id)
  end

  def show
    @path = 'trips'
    @trip = Trip.find params[:id]
    @dep_airport = Airport.find(@trip.scheduled_flight.from_airport_id)
    @arr_airport = Airport.find(@trip.scheduled_flight.to_airport_id)
  end

  def destroy
    Trip.destroy params[:id]
    redirect_to trips_path
  end
end
