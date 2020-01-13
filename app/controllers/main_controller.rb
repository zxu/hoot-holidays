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
      Passenger.column_names.sort.each do |col|
        p col
        p Passenger.columns_hash[col].type
        col_type = Passenger.columns_hash[col].type
        if col_type != :date && col_type != :datetime
          @passenger.send("#{col}=", params[:passenger][col])
        else
          year = params[:passenger]["#{col}(1i)"]
          month = params[:passenger]["#{col}(2i)"]
          day = params[:passenger]["#{col}(3i)"]
          @passenger.send("#{col}=", "#{day}/#{month}/#{year}")
        end
      end
      p @passenger.inspect
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
