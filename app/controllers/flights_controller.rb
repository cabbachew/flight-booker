class FlightsController < ApplicationController
  FILTER_PARAMS = [:departure_airport_id, :arrival_airport_id]

  def index
    # Not needed using collection_select helper with :include_blank option
    # @airport_options = Airport.all.pluck(:iata_code, :id).unshift(["--", nil])
    @flights = Flight.where(filter_object)
  end
  
  private 
  
  def filter_object
    obj = {}
    FILTER_PARAMS.each do |key|
      if params[key].present?
        obj[key] = params[key]
      end
    end
    obj
  end
end
