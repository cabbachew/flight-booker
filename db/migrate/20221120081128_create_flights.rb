class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.bigint :departure_airport_id, null: false
      t.bigint :arrival_airport_id, null: false
      t.time :datetime, null: false
      t.integer :duration, null: false

      t.timestamps
    end
  end
end
