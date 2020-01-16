class CarriersController < ApplicationController
  def new
  end

  def create
  end

  def index
    @path = 'maintenance'
    @carrier = Carrier.new
  end

  def show
  end

  def edit
  end

  def update
    @path = 'maintenance'
    if params[:search].present?
      @carrier = Carrier.where(iata_code: params[:carrier][:iata_code])
      @carrier = @carrier.present? ? @carrier.first : Carrier.new
      render 'index'
    else
      if Carrier.exists?(params[:id])
        @carrier = Carrier.find(params[:id])
        begin
          @carrier.update(name: params[:carrier][:name],
                          alliance: params[:carrier][:alliance],
                          logo: params[:carrier][:logo])
        rescue Exception => e
          flash[:carrier_message] = e
        end

        flash[:carrier_message] = 'Airlines updated successfully.'
      else
        @carrier = Carrier.new
      end

      render 'index'
    end
  end

  def destroy
  end
end
