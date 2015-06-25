module Programs
  class HelloProgram < Program
    @command = "hello"

    def initialize
      @actions = {
        /.*/ => lambda { |params| @responses[:hello].random }
      }
      @responses = {
        hello: ['Hello! 😄', 'Yes, this is house 🏠']
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
