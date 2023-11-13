Flight.delete_all
Spaceport.delete_all


spaceports_data = [
  { full_name: 'Venus Observatory', code: 'VNO' },
  { full_name: 'Earth', code: 'ERT' },
  { full_name: 'Mars', code: 'MRS' },
  { full_name: 'Phobos', code: 'PBS' },
  { full_name: 'Ganymede', code: 'GNM' },
  { full_name: 'Ceres', code: 'CER' },
  { full_name: 'Titan', code: 'TTN' },
  { full_name: 'Pluto', code: 'PLT' }
]

spaceports = spaceports_data.map { |sp| Spaceport.create(sp) }

# Average distances between celestial bodies (in miles)
# Super simplified, of course, but good nuff for this
average_distances = {
  'VNO' => 66_000_000,
  'ERT' => 93_000_000,
  'MRS' => 142_000_000,
  'PBS' => 143_000_000,
  'GNM' => 484_000_000,
  'CER' => 257_000_000,
  'TTN' => 886_000_000,
  'PLT' => 4_670_000_000
}

# Generate flights
number_of_flights = 64 # Adjust as needed

number_of_flights.times do |index|
  departure_spaceport = spaceports[index % 8]
  arrival_spaceport = (spaceports - [departure_spaceport]).sample

  distance = (average_distances[arrival_spaceport.code] - average_distances[departure_spaceport.code]).abs

  # Assuming spaceship speed of 300,000 mph
  duration_hours = (distance / 300_000.00)
  takeoff_datetime = rand(1.day.from_now..30.days.from_now)

  Flight.create(
    departure_spaceport: departure_spaceport,
    arrival_spaceport: arrival_spaceport,
    duration: duration_hours,
    takeoff: takeoff_datetime
  )
end