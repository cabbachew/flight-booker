class AddUniqueIndexToIataCode < ActiveRecord::Migration[7.0]
  def change
    add_index :airports, :iata_code, unique: true
  end
end
