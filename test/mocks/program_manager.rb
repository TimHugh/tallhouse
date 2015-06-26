class ProgramManager
  class TestProgram < Program
    def init
      @actions[/.*/] = lambda { |params| @responses[:test].random }
      @responses[:test] = [
        'Test response'
      ]
    end
  end

  def initialize
    @programs = {'test' => TestProgram}
  end
end
