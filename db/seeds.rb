# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# airlines
south_west = Airline.create(name: "South West")
frontier = Airline.create(name: "Frontier")

#flights
flight1 = Flight.create(
                    number: "1727",
                    date: "08/03/20",
                    time: "3:30pm MT",
                    departure_city: "Denver",
                    arrival_city: "New York",
                    airline_id: frontier.id)
flight2 = Flight.create(
                    number: "1010",
                    date: "08/03/20",
                    time: "3:30pm MT",
                    departure_city: "Los Angeles",
                    arrival_city: "Las Vegas",
                    airline_id: south_west.id)
flight3 = Flight.create(
                    number: "2351", 
                    date: "10/13/20",
                    time: "3:30pm MT",
                    departure_city: "Las Vegas",
                    arrival_city: "Los Angeles",
                    airline_id: south_west.id)

#passengers
holiday = Passenger.create(name: "Holiday", age: 30)
samuel = Passenger.create(name: "Samuel", age: 36)
karen = Passenger.create(name: "Karen", age: 56)
dexter = Passenger.create(name: "Dexter", age: 3)
manny = Passenger.create(name: "Manny", age: 18)

#passenger_flights
PassengerFlight.create(passenger_id: holiday.id, flight_id: flight1.id)
PassengerFlight.create(passenger_id: holiday.id, flight_id: flight2.id)
PassengerFlight.create(passenger_id: holiday.id, flight_id: flight3.id)
PassengerFlight.create(passenger_id: samuel.id, flight_id: flight2.id)
PassengerFlight.create(passenger_id: karen.id, flight_id: flight3.id)
PassengerFlight.create(passenger_id: dexter.id, flight_id: flight1.id)
PassengerFlight.create(passenger_id: manny.id, flight_id: flight1.id)







