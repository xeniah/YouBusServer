require 'test_helper'

class StopTimesTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert StopTimes.new.valid?
  end
end
