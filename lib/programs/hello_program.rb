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
  end
end
