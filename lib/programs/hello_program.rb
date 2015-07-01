module Programs
  class HelloProgram
    include Responder
    @trigger = /hello|hey|howdy/i

    def init
      @actions[/.*/] = ->(params) { @responses[:hello].random }
      @responses[:hello] = ["Hello! 🏡", "Yes, this is house 🏡"]
    end
  end
end
