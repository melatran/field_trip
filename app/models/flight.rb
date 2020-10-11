class Flight < ApplicationRecord
  belongs_to :airline
  has_many :passenger_flights
  has_many :passengers, through: :passenger_flights
  
  def count_adults
    passengers.where("age > 18").count
  end

  def count_minors
    passengers.where("age < 18").count
  end
end