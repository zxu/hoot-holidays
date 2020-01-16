class MainController < ApplicationController
  before_action :check_if_logged_in

  def index
    @path = 'new_booking'
  end

  def auto_complete
    @airports = Airport.ransack(iata_code_cont: params[:q], name_cont: params[:q], m: 'or').result(distinct: true)

    respond_to do |format|
      format.html {}
      format.json {
        @airports = @airports.limit(10)
      }
    end
  end

  def search
    @dep_code, @dep_name = params[:dep].split(' - ')
    @arr_code, @arr_name = params[:arr].split(' - ')

    dep_airport = Airport.where(iata_code: @dep_code).limit 1
    arr_airport = Airport.where(iata_code: @arr_code).limit 1
    @flights = ScheduledFlight.where(from_airport_id: dep_airport.first.id, to_airport_id: arr_airport.first.id).limit 10

    respond_to do |format|
      format.js
    end
  end

  def choose_flight
    @passenger = populate_record :passenger, Passenger, params

    @countries = Country.all.map do |c|
      [c.name, c.name]
    end

    respond_to do |format|
      format.js
    end
  end

  def passenger
    if params[:nav_back]
      @to_path = 'search-results'
    else
      @card = populate_record :card, Card, params
      @to_path = 'payment-details'
    end
    respond_to do |format|
      format.js
    end
  end

  def payment
    if params[:nav_back]
      @to_path = 'passenger-details'
    else
      @to_path = 'preview-trip'
      @flight = ScheduledFlight.find(params['selected-flight'])
      @trip = Trip.new
      @trip.dep_date = Date.strptime(params[:date], "%m/%d/%Y")
      @dep_airport = Airport.find(@flight.from_airport_id)
      @arr_airport = Airport.find(@flight.to_airport_id)
      @passenger = populate_record :passenger, Passenger, params
    end
    respond_to do |format|
      format.js
    end
  end

  def book
    passenger = Passenger.create passenger_params

    begin
      trip = Trip.create dep_date: Date.strptime(params[:date], "%m/%d/%Y"),
                         passenger_id: passenger.id,
                         scheduled_flight_id: params["selected-flight"],
                         user_id: session[:user_id]
    rescue Exception => e
      flash[:booking_result] = e
    end
    flash[:booking_result] = 'Successfully booked!'
    @path = 'trips'
    redirect_to trip_path trip.id
  end

  private

  def populate_record(model, model_class, params)
    record = model_class.new
    if params[model]
      model_class.column_names.sort.each do |col|
        col_type = model_class.columns_hash[col].type
        if col_type != :date && col_type != :datetime
          record.send("#{col}=", params[model][col])
        else
          year = params[model]["#{col}(1i)"]
          month = params[model]["#{col}(2i)"]
          day = params[model]["#{col}(3i)"]
          record.send("#{col}=", "#{day}/#{month}/#{year}")
        end
      end
    end
    record
  end

  def passenger_params
    params.require(:passenger).permit(:name, :email, :dob, :passport_no, :passport_country, :phone)
  end
end
