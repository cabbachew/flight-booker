class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.pluck(:iata_code, :id).unshift(["--", nil])
    @flights = Flight.where(filter_object)
  end
  
  def filter_object
    obj = {}
    if params[:departure_airport_id].present?
      obj[:departure_airport_id] = params[:departure_airport_id]
    end
    if params[:arrival_airport_id].present?
      obj[:arrival_airport_id] = params[:arrival_airport_id]
    end
    obj
  end
end
