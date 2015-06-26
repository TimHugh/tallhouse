module Programs
  class HelloProgram < Program
    @trigger = /hello|hey|howdy/i

    def initialize
      @actions = {
        /.*/ => lambda { |params| @responses[:hello].random }
      }
      @responses = {
        hello: ['Hello! 😄', 'Yes, this is house 🏠']
      }
    end
  end
end
