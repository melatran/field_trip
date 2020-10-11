require 'rails_helper'

describe "Passenger Show Page" do
  before :each do
    @south_west = Airline.create(name: "South West")
    @frontier = Airline.create(name: "Frontier")
    @flight1 = Flight.create(
                    number: "1727",
                    date: "08/03/20",
                    time: "3:30pm MT",
                    departure_city: "Denver",
                    arrival_city: "New York",
                    airline_id: @frontier.id)
    @flight2 = Flight.create(
                    number: "1010",
                    date: "08/03/20",
                    time: "3:30pm MT",
                    departure_city: "Los Angeles",
                    arrival_city: "Las Vegas",
                    airline_id: @south_west.id)
    @flight3 = Flight.create(
                    number: "2351", 
                    date: "10/13/20",
                    time: "3:30pm MT",
                    departure_city: "Las Vegas",
                    arrival_city: "Los Angeles",
                    airline_id: @south_west.id)
    @holiday = Passenger.create(name: "Holiday", age: 30)
    PassengerFlight.create(passenger_id: @holiday.id, flight_id: @flight1.id)
    PassengerFlight.create(passenger_id: @holiday.id, flight_id: @flight2.id)
  end

  it "display information about passenger's flights" do
    visit "/passengers/#{@holiday.id}"

    expect(page).to have_content("Holiday")
    
    within ".flights" do
      expect(page).to have_content("Flight 1727")
      expect(page).to have_content("Flight 1010")
    end
  end

  it "can click to flights show page" do
    visit "/passengers/#{@holiday.id}"

    click_on "1727"
    expect(current_path).to eq("/flights/#{@flight1.id}")
  end

  it "can add a new flight for a passenger using a form on page" do
    visit "/passengers/#{@holiday.id}"
    expect(page).to_not have_content("2351")

    within ".new_flight" do
      expect(page).to have_content("Add New Flight")
      fill_in :number, with: "2351"
      click_on "Add Flight"
    end
    expect(current_path).to eq("/passengers/#{@holiday.id}")
    expect(page).to have_content("Flight 2351")
  end

  it "can't add an existing flight" do
    visit "/passengers/#{@holiday.id}"
    within ".new_flight" do
      expect(page).to have_content("Add New Flight")
      fill_in :number, with: "1727"
      click_on "Add Flight"
    end
    expect(page).to have_content("The passenger is on this flight")
  end

  it "can't add an invalid flight number" do
    visit "/passengers/#{@holiday.id}"
    within ".new_flight" do
      expect(page).to have_content("Add New Flight")
      fill_in :number, with: "17273"
      click_on "Add Flight"
    end
    expect(page).to have_content("The flight number is invalid.")
  end
end