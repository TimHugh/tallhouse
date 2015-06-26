class Response < String
  class << self
    def new(params = {})
      @program_manager = ProgramManager.new
      begin
        response_string = @program_manager.respond(params)
      rescue RuntimeError => e
        response_string = error_response(e)
      end
      super response_string
    end

    protected

    def error_response(exception)
      case exception
      when ProgramManager::MissingCommand
        ["What? I can't hear you! 🙉", "Cat got your tongue? 😼🙉"].random
      when ProgramManager::UnknownCommand
        ["I don't know what that means! 🙈", "Your words have fallen on deaf ears 🙉"].random
      end
    end
  end
end
