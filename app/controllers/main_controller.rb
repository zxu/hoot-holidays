class MainController < ApplicationController
  def index
  end

  def auto_complete
    @airports = Airport.ransack(iata_code_cont: params[:q]).result(distinct: true)

    respond_to do |format|
      format.html {}
      format.json {
        @airports = @airports.limit(5)
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
    @passenger = Passenger.new
    if params[:passenger]
      Passenger.column_names.each do |col|
        @passenger.send("#{col}=", params[:passenger][col])
      end
    end

    @countries = Country.all
    respond_to do |format|
      format.js
    end
  end

  def passenger
    if params[:nav_back]
      @to_path = 'search-results'
    else
      @to_path = 'passenger-details'
    end
    respond_to do |format|
      format.js
    end
  end
end
