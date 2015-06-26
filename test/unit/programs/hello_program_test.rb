require 'test_helper'

class HelloProgramTest < Test
  def program
    @program ||= Programs::HelloProgram.new
  end

  def test_default_response
    refute program.respond(Body: 'Hello, house!').empty?
  end
end
