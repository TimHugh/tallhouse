module Programs
  class TestProgram < Program
    @trigger = /test/

    def init
      @actions[/.*/] = ->(params) { @responses[:test].random }
      @responses[:test] = [
        'Test response'
      ]
    end
  end
end
