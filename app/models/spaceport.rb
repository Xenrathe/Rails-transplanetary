class Spaceport < ApplicationRecord
  has_many :departing_flights, foreign_key: "departure_spaceport_id", class_name: "Flight"
  has_many :arriving_flights, foreign_key: "arrival_spaceport_id", class_name: "Flight"
end
