module Programs
  class TestProgram < Program
    @trigger = /test/

    def init
      action /.*/ do
        'Test response'
      end
    end
  end
end
