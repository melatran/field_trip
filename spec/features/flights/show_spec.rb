require 'rails_helper'

describe "Flight's Show Page" do
  before :each do
    @south_west = Airline.create(name: "South West")
    @flight1 = Flight.create(
                    number: "1727",
                    date: "08/03/20",
                    time: "3:30pm MT",
                    departure_city: "Denver",
                    arrival_city: "New York",
                    airline_id: @south_west.id)
    @holiday = Passenger.create(name: "Holiday", age: 30)
    @dexter = Passenger.create(name: "Dexter", age: 3)
    @manny = Passenger.create(name: "Manny", age: 19)
    PassengerFlight.create(passenger_id: @holiday.id, flight_id: @flight1.id)
    PassengerFlight.create(passenger_id: @dexter.id, flight_id: @flight1.id)
    PassengerFlight.create(passenger_id: @manny.id, flight_id: @flight1.id)
  end

  it "user can view information about a flight" do
    visit "/flights/#{@flight1.id}"

    expect(page).to have_content("Flight 1727")
    expect(page).to have_content("Date: 08/03/20")
    expect(page).to have_content("Time: 3:30pm MT")
    expect(page).to have_content("Departure City: Denver")
    expect(page).to have_content("Arrival City: New York")
    expect(page).to have_content("Airline: South West")
    
    within ".passengers" do
      expect(page).to have_content("Holiday")
      expect(page).to have_content("Dexter")
      expect(page).to have_content("Manny")
    end
  end

  it "lists the number of minors and number of adults" do
    visit "/flights/#{@flight1.id}"
   
    expect(page).to have_content("Number of Adults: 2")
    expect(page).to have_content("Number of Minors: 1")
  end
end