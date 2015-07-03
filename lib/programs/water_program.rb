module Programs
  class WaterProgram < Program
    @trigger = /water|garden/i

    def init
      action /.*/ do |params|
        @responses[:thank_you].random
      end
      add_response :thank_you, "Thanks for watering! 🌻🎉"
      add_response :thank_you, "Happy flowers, happy garden! 🌻😄"
    end
  end
end
