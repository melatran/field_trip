class PassengerFlightsController < ApplicationController
  def create
    passenger = Passenger.find(params[:id])
    flight = Flight.where(number: params[:number]).first
    passenger_flight = PassengerFlight.where(flight: flight, passenger_id: passenger.id).first
    if flight.nil?
      flash[:error] = "The flight number is invalid."
    elsif passenger_flight.nil? && Flight.exists?(flight.id)
      PassengerFlight.create(flight: flight, passenger_id: passenger.id)
    elsif PassengerFlight.exists?(passenger_flight.id)
      flash[:error] = "The passenger is on this flight."
    end
    redirect_to "/passengers/#{passenger.id}"
  end
end

#find the passenger that matches the id
#find the flight number that matches the number entered
#if the passenger is on the flight, show error, passenger is already on this flight
#if the passenger is not on flight, go ahead and create the flight
# if number entered doesn't exist, no flight added