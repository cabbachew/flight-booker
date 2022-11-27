class Booking < ApplicationRecord
  belongs_to :flight

  has_many :passengers

  # validates :flight_id, presence: true # Simple Form will mark fields as required
end
