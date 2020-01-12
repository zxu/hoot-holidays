class MainController < ApplicationController
  def index
  end

  def auto_complete
    #raise 'hell'
    #
    @airports    = Airport.ransack(iata_code_cont: params[:q]).result(distinct: true)
    p @airports.last
    #@directors = Director.ransack(name_cont: params[:q]).result(distinct: true)

    respond_to do |format|
      format.html {}
      format.json {
        @airports    = @airports.limit(5)
      }
    end
  end

  def search
    p params
    @dep_code, @dep_name = params[:dep].split(' - ')
    @arr_code, @arr_name = params[:arr].split(' - ')

    dep_airport = Airport.where(iata_code: @dep_code).limit 1
    arr_airport = Airport.where(iata_code: @arr_code).limit 1
    p dep_airport
    p arr_airport
    @flights = ScheduledFlight.where(from_airport_id: dep_airport.first.id, to_airport_id: arr_airport.first.id).limit 10

    respond_to do |format|
      format.js
    end
  end

  def passenger
    p params

    @passenger = Passenger.new
    #@passenger.name = 'Tom'

    @countries = Country.all
    respond_to do |format|
      format.js
    end
  end
end
