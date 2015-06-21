require 'test_helper'

class ProgramManagerTest < Test
  def program_manager
    @program ||= ProgramManager.new
  end

  def test_unknown_response
    assert_raises ProgramManager::UnknownCommand do
      program_manager.respond('unknown-command')
    end
  end
end
