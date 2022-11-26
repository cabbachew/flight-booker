class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  has_many :bookings
  has_many :passengers, through: :bookings

  # validates_comparison_of
  validates :arrival_airport_id, comparison: { other_than: :departure_airport_id}
  validates :date, :duration, presence: true

  def departure_code
    departure_airport.iata_code
  end

  def arrival_code
    arrival_airport.iata_code
  end

  def summary
    "From #{departure_code} to #{arrival_code} on #{date}"
  end
end
