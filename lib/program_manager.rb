class ProgramManager
  class UnknownCommand < RuntimeError; end

  attr_reader :programs

  def initialize
    @programs = {}
    Programs.constants.each do |constant|
      next if constant.to_s[/.*Program$/].nil?
      program = Programs.const_get(constant)
      @programs[program.command.downcase] = program
    end
  end

  def respond(params = {})
    body = params[:Body].downcase
    @programs.keys.each do |command|
      if body[/#{command}/]
        @program = @programs[command]
        break
      end
    end
    @program.new.respond(params)
  rescue
    raise UnknownCommand
  end
end
