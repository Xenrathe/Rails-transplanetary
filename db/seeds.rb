Passenger.delete_all
Booking.delete_all
Flight.delete_all
Spaceport.delete_all


spaceports_data = [
  { full_name: 'Venus Observatory', code: 'VNO', population: 472, year_founded: 2112, img_url: 'venus.png', description: 'description' },
  { full_name: 'Earth', code: 'ERT', population: 11500000000, year_founded: 2050, img_url: 'earth.png', description: 'description' },
  { full_name: 'Mars', code: 'MRS', population: 27350000, year_founded: 2065, img_url: 'mars.png', description: 'description' },
  { full_name: 'Phobos', code: 'PBS', population: 320000, year_founded: 2070, img_url: 'phobos.png', description: 'description' },
  { full_name: 'Ganymede', code: 'GNM', population: 110000, year_founded: 2114, img_url: 'ganymede.png', description: 'description' },
  { full_name: 'Ceres', code: 'CER', population: 12000000, year_founded: 2104, img_url: 'ceres.png', description: 'description' },
  { full_name: 'Titan', code: 'TTN', population: 370000, year_founded: 2118, img_url: 'titan.png', description: 'description' },
  { full_name: 'Pluto', code: 'PLT', population: 125, year_founded: 2130, img_url: 'pluto.png', description: 'description' }
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
number_of_flights = 128 # Adjust as needed

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