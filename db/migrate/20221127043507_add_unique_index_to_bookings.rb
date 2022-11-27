class AddUniqueIndexToBookings < ActiveRecord::Migration[7.0]
  def change
    add_index :bookings, [:flight_id, :passenger_id], unique: true
  end
end
