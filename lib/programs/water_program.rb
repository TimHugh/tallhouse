module Programs
  class WaterProgram < Program
    @trigger = /water|garden/i

    def init
      action /.*/ do |params|
        response :thank_you
      end
      add_response :thank_you, "Thanks for watering! 🌻🎉", "Happy flowers, happy garden! 🌻😄"
    end
  end
end
