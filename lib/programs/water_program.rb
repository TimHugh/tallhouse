module Programs
  class WaterProgram < Program
    @command = "water"

    def initialize
      @actions = {
        /.*/ => lambda { |params| @responses[:thank_you].random }
      }
      @responses = {
        thank_you: ["Thanks for watering! 🌻🎉", "Happy flowers, happy garden! 🌻😄"]
      }
    end

    def respond(params = {})
      @actions.each do |pattern, action|
        if params[:Body][pattern]
          return action.call(params)
        end
      end
    end
  end
end
