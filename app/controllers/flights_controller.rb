class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.pluck(:iata_code, :id).unshift(["--", nil])
    @flights = Flight.all
    if params[:departure_airport_id].present?
      @flights = @flights.where(departure_airport_id: params[:departure_airport_id])
    end
    if params[:arrival_airport_id].present?
      @flights = @flights.where(arrival_airport_id: params[:arrival_airport_id])
    end
  end
end
