module Programs
  class WaterProgram < Program
    @trigger = /water|garden/i

    def init
      @actions[/.*/] = ->(params) { @responses[:thank_you].random }
      @responses[:thank_you] = [
        "Thanks for watering! 🌻🎉",
        "Happy flowers, happy garden! 🌻😄"]
    end
  end
end
