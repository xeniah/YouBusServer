require 'test_helper'

class TripsTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Trips.new.valid?
  end
end
