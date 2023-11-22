Passenger.delete_all
Booking.delete_all
Flight.delete_all
Spaceport.delete_all

spaceports_data = [
  { full_name: 'Venus Observatory', code: 'VNO', population: 2250, year_founded: 2112, img_url: 'venus.png', description: 'Venus Observatory, an elite orbital sanctuary, circles Venus as an exclusive haven for the privileged few. Reserved for the crème de la crème of space enthusiasts, this celestial jewel offers an unprecedented blend of luxury and scientific exploration. With its opulent amenities and breathtaking views of the cosmos, Venus Observatory stands as the ultimate retreat for those seeking an otherworldly experience beyond the bounds of Earth.' },
  { full_name: 'Earth', code: 'ERT', population: 11500000000, year_founded: 2050, img_url: 'earth.png', description: 'Earth, the cradle of humanity and the heart of our cosmic journey, remains the true home in the vast universe. As the birthplace of human civilization and the launchpad for our explorations into the far reaches of the solar system and beyond, Earth stands as a testament to the indomitable spirit of exploration.' },
  { full_name: 'Mars', code: 'MRS', population: 27350000, year_founded: 2065, img_url: 'mars.png', description: 'Mars, the crown jewel of our solar system expansion, stands as a testament to human ingenuity and perseverance. Boasting multiple cities interconnected by a cutting-edge underground ultra-high-speed rail network, the Red Planet is a marvel of engineering and the fastest growing job market in our solar system.' },
  { full_name: 'Phobos', code: 'PBS', population: 320000, year_founded: 2070, img_url: 'phobos.png', description: "Behold Phobos, the bustling manufacturing hub of Mars. This moon is not just a stop-over for those visiting the Red Planet; it's an entire manufacturing colony, with an intricate network of tunnels and habitat modules seamlessly integrated beneath its rugged surface." },
  { full_name: 'Ganymede', code: 'GNM', population: 110000, year_founded: 2114, img_url: 'ganymede.png', description: 'Discover Ganymede, the breadbasket of the outer colonies, boasting the most advanced agricultural systems and greenhouses known to humanity. Beyond its fertile landscapes, Ganymede is a hub of cutting-edge biological and genetic experimentation, pushing the boundaries of science and sustainability, all beneath the unparalleled grandeur of Jupiter, the Red Giant.' },
  { full_name: 'Ceres', code: 'CER', population: 12000000, year_founded: 2104, img_url: 'ceres.png', description: 'Nestled in the asteroid belt, Ceres links the inner and outer solar system. Serving as a bustling marketplace for goods traversing between colonies, its strategic importance is set to soar with the continued expansion of the outer reaches. Experience the heartbeat of interstellar commerce at the gateway to our celestial frontier.' },
  { full_name: 'Titan', code: 'TTN', population: 370000, year_founded: 2118, img_url: 'titan.png', description: "Embark on a journey to Titan, where dreams come alive in a colossal theme park like no other. This distant moon invites visitors to escape reality with a myriad of fantasies. Explore the fantastical 'Land of Dragons,' traverse the neon-lit streets of the cyberpunk 'Noir City,' or enjoy family-friendly adventures in the whimsical 'Bounce Colony.' Titan promises a vacation like never before, where imagination knows no bounds against the backdrop of Saturn's mesmerizing rings." },
  { full_name: 'Pluto', code: 'PLT', population: 965, year_founded: 2130, img_url: 'pluto.png', description: "Venture to Pluto, our newest colony on the edge of the solar system, poised for rapid expansion with the impending launch of the first interstellar mission in 2150. As pioneers set their sights beyond our sun's influence, Pluto stands as a gateway to the mysteries of interstellar space, offering a frontier for bold explorers and the promise of a burgeoning outpost in the vast cosmic expanse." }
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