module Programs
  class HelloProgram < Program
    @trigger = /hello|hey|howdy/i

    def init
      action(/.*/) do |_|
        response :hello
      end
      add_response :hello, "Hello! 🏡", "Yes, this is house 🏡"
    end
  end
end
