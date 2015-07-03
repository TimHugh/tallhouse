module Programs
  class HelloProgram < Program
    @trigger = /hello|hey|howdy/i

    def init
      action(/.*/) do |_|
        @responses[:hello].random
      end
      add_response :hello, "Hello! 🏡"
      add_response :hello, "Yes, this is house 🏡"
    end
  end
end
