class FlightsController < ApplicationController
  # FILTER_PARAMS = [:departure_airport_id, :arrival_airport_id]
  # Map params submitted under different name to correct filter params:
  # MAPPED_PARAMS = {
  #   departure_code: :departure_airport_id,
  #   arrival_code: :arrival_airport_id,
  #   date: :date
  # }

  def index
    # @airports = Airport.all.order(:iata_code)

    # @arrival_airports = Airport.all.order(:iata_code)
    @arrival_airports = Airport.joins(:arriving_flights).where.not(arriving_flights: { id: nil }).distinct.order(:iata_code)
    # @departure_airports = Airport.all.order(:iata_code)
    @departure_airports = Airport.joins(:departing_flights).where.not(departing_flights: { id: nil }).distinct.order(:iata_code)
    
    # Not needed using collection_select helper with :include_blank option
    # @airport_options = Airport.all.pluck(:iata_code, :id).unshift(["--", nil])
    
    # @flights = Flight.where(filter_params)
    @flights = Flight.all.order(:date)
    @query_params = query_params
    if query_params[:departure_code].present?
      @flights = @flights.where(departure_airport_id: query_params[:departure_code]).order(:date)
      @arrival_airports = Airport.joins(:arriving_flights).where(arriving_flights: { departure_airport_id: query_params[:departure_code] }).order(:iata_code)
    end
    if query_params[:arrival_code].present?
      @flights = @flights.where(arrival_airport_id: query_params[:arrival_code]).order(:date)
      @departure_airports = Airport.joins(:departing_flights).where(departing_flights: { arrival_airport_id: query_params[:arrival_code] }).order(:iata_code)
    end
    if query_params[:date].present?
      @flights = @flights.where(date: query_params[:date]).order(:date)
      @arrival_airports = Airport.joins(:arriving_flights).where(arriving_flights: { date: query_params[:date] }).order(:iata_code)
      @departure_airports = Airport.joins(:departing_flights).where(departing_flights: { date: query_params[:date] }).order(:iata_code)
    end
  end
  
  private 
  
  # def filter_params
  #   obj = {}
  #   # FILTER_PARAMS.each do |key|
  #   #   if params[key].present?
  #   #     obj[key] = params[key]
  #   #   end
  #   # end
  #   MAPPED_PARAMS.each do |key, value|
  #     if query_params[key].present?
  #       obj[value] = query_params[key]
  #     end
  #   end
  #   obj
  # end

  def query_params # Strong parameters
    params.fetch(:query, {}).permit(:departure_code, :arrival_code, :num_tickets, :date)
  end

  # def query_date
  #   Date.new(
  #     query_params["date(1i)"].to_i,
  #     query_params["date(2i)"].to_i, 
  #     query_params["date(3i)"].to_i
  #   )
  # end
end
