class Passenger < ApplicationRecord
  has_many :bookings
  has_many :flights, through: :bookings

  validates :first_name, :last_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
