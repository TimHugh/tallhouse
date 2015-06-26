module Programs
  class WaterProgram < Program
    @command = "water"

    def init
      @actions[/.*/] = lambda { |params| @responses[:thank_you].random }
      @responses[:thank_you] = [
        "Thanks for watering! 🌻🎉",
        "Happy flowers, happy garden! 🌻😄"]
    end
  end
end
