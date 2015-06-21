require './program.rb'
Dir.glob('./programs/**/*').each do |file|
  require file
end

module GardenBuddy
  class ProgramManager
    class UnknownCommand < RuntimeError; end

    def initialize
      @programs = {}
      GardenBuddy.constants.each do |constant|
        @programs[program.command] = program unless p.class.to_s[/.*Program$/].nil?
      end
    end

    def respond(command, params = {})
      raise UnknownCommand unless @programs.include? command
      @program = @programs[command]
      @program.respond(params)
    end
  end
end
