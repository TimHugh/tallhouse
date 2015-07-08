require 'test_helper'

class ResponseTest < Test
  def test_normal_response
    assert_equal 'Test response', Response.new('Body' => 'test')
  end

  def test_missing_response
    refute Response.new.empty?
  end

  def test_unknown_response
    refute Response.new('Body' => 'unknown-command').empty?
  end
end
