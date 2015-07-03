module Programs
  class TestProgram < Program
    @trigger = /test/

    def init
      action /.*/ do
        @responses[:test].random
      end
      add_response :test, 'Test response'
    end
  end
end
