require 'test_helper'

class StopTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Stop.new.valid?
  end
end
