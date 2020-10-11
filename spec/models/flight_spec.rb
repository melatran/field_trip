require 'rails_helper'

describe Flight do
  describe "relationships" do
    it {should belong_to :airline}
    it {should have_many :passenger_flights}
    it {should have_many(:passengers).through(:passenger_flights)}
  end

  describe "methods" do
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

    it ".count_adults" do
      expect(@flight1.count_adults).to eq(2)
    end

    it ".count_adults" do
      expect(@flight1.count_minors).to eq(1)
    end
  end
end