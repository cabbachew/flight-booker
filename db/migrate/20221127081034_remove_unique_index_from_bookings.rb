class RemoveUniqueIndexFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_index :bookings, [:flight_id, :passenger_id], unique: true
  end
end
