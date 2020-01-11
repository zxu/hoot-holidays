class MainController < ApplicationController
  def index
  end

  def search
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
end
