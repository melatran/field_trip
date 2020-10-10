require 'rails_helper'

describe Airline do
  describe "relationships" do
    it {should have_many :flights}
  end
end