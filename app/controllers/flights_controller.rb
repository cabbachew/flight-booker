class FlightsController < ApplicationController
  # FILTER_PARAMS = [:departure_airport_id, :arrival_airport_id]
  # Map params submitted under different name to correct filter params:
  MAPPED_PARAMS = {
    departure_code: :departure_airport_id,
    arrival_code: :arrival_airport_id
  }

  def index
    # Not needed using collection_select helper with :include_blank option
    # @airport_options = Airport.all.pluck(:iata_code, :id).unshift(["--", nil])
    @flights = Flight.where(filter_params)
  end
  
  private 
  
  def filter_params
    obj = {}
    # FILTER_PARAMS.each do |key|
    #   if params[key].present?
    #     obj[key] = params[key]
    #   end
    # end
    MAPPED_PARAMS.each do |key, value|
      if params[key].present?
        obj[value] = params[key]
      end
    end
    obj
  end
end
