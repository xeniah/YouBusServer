require 'test_helper'

class RouteTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Route.new.valid?
  end
end
