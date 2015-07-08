require 'test_helper'

class WaterProgramTest < Test
  def program
    @program ||= Programs::WaterProgram.new
  end

  def test_default_response
    assert_match '🌻', program.respond('Body' => 'I watered today!')
  end
end
