class Passenger < ApplicationRecord
  belongs_to :booking

  delegate :flight, to: :booking

  validates :first_name, :last_name, :email, presence: true # Simple Form will mark fields as required
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
