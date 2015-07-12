module Programs
  class HelloProgram < Program
    @trigger = /hello|hey|howdy/i

    def init
      action(/.*/) do |_|
        [
          "Hello! 🏡",
          "Yes, this is house 🏡"
        ].random
      end
    end
  end
end
