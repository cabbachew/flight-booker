class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  validates :arrival_airport_id, comparison: { other_than: :departure_airport_id}
end
