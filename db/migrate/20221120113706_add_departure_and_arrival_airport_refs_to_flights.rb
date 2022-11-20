class AddDepartureAndArrivalAirportRefsToFlights < ActiveRecord::Migration[7.0]
  def change
    add_index :flights, :departure_airport_id, name: "index_flights_on_departure_airport_id"
    add_index :flights, :arrival_airport_id, name: "index_flights_on_arrival_airport_id"
  end

  add_foreign_key :flights, :airports, column: "departure_airport_id"
  add_foreign_key :flights, :airports, column: "arrival_airport_id"
end
