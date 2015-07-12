module Programs
  class WaterProgram < Program
    @trigger = /water|garden/i

    def init
      action /.*/ do |params|
        [
          "Thanks for watering! 🌻🎉",
          "Happy flowers, happy garden! 🌻😄"
        ].random
      end
    end
  end
end
