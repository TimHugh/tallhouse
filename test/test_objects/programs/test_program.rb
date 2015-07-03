module Programs
  class TestProgram < Program
    @trigger = /test/

    def init
      action /.*/ do
        response :test
      end
      add_response :test, 'Test response'
    end
  end
end
