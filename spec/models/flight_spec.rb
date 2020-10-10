require 'rails_helper'

describe Flight do
  describe "relationships" do
    it {should belong_to :airline}
    it {should have_many :passenger_flights}
    it {should have_many(:passengers),through(:passenger_flights)}
  end
end