class AddFlightAndPassengerRefToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :flight, null: false, foreign_key: true, index: true
    add_reference :bookings, :passenger, null: false, foreign_key: true, index: true
  end
end
