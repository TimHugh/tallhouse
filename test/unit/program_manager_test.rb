require 'test_helper'

class ProgramManagerTest < Test
  class ProgramManager < ProgramManager
    class TestProgram < Program
      def respond(params)
        'Test response'
      end
    end

    def initialize
      super
      @programs = {'test' => TestProgram}
    end
  end

  def program_manager
    @program ||= ProgramManager.new
  end

  def test_known_response
    assert_match 'Test response', program_manager.respond(Body: 'test')
  end

  def test_command_substring
    assert_match 'Test response', program_manager.respond(Body: 'This is a test message')
  end

  def test_unknown_response
    assert_raises ProgramManager::UnknownCommand do
      program_manager.respond(Body: 'unknown-command')
    end
  end

  def test_blank_response
    assert_raises ProgramManager::MissingCommand do
      program_manager.respond
    end
  end
end
