require 'test_helper'

class ResponseTest
  def test_normal_response
    assert_equal 'Test response', Response.new(Body: 'test')
  end

  def test_missing_response
    assert_raises ProgramManager::MissingCommand do
      Response.new
    end
  end

  def test_unknown_response
    assert_raises ProgramManager::UnknownCommand do
      Response.new(Body: 'unknown')
    end
  end
end
