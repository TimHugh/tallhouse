require 'test_helper'

class StringTest < Test
  def test_underscore
    assert_equal 'tall_house', 'TallHouse'.underscore
  end

  def test_classify
    assert_equal 'TallHouse', 'tall_house'.classify
  end
end
