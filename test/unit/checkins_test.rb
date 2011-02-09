require 'test_helper'

class CheckinsTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Checkins.new.valid?
  end
end
