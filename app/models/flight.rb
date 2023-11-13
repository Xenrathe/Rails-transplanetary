class Flight < ApplicationRecord
  belongs_to :departure_spaceport, class_name: "Spaceport"
  belongs_to :arrival_spaceport, class_name: "Spaceport"
  has_many :bookings
end
