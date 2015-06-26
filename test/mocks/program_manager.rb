class ProgramManager
  class TestProgram < Program
    def init
      @actions[/.*/] = lambda { |params| @responses[:test].random }
      @responses[:test] = [
        'Test response'
      ]
    end
  end

  alias_method :old_init, :initialize
  def initialize
    super_return = old_init
    @programs['test'] = TestProgram
    super_return
  end
end
