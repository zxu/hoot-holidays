class NavController < ApplicationController
  def main
    from_path = params[:from]
    @to_path = case from_path
               when 'passenger-details'
                 'search-results'
               when 'checkout-screen'
                 'passenger-details'
               end

    respond_to do |format|
      format.js
    end
  end
end
