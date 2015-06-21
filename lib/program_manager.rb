class ProgramManager
  class UnknownCommand < RuntimeError; end

  attr_reader :programs

  def initialize
    @programs = {}
    Programs.constants.each do |constant|
      next if constant.to_s[/.*Program$/].nil?
      program = Programs.const_get(constant)
      @programs[program.command] = program
    end
  end

  def respond(params)
    body = params[:Body]
    @program = nil
    @programs.keys.each do |command|
      if body[/^#{command}.*/]
        @program = @programs[command]
        break
      end
    end
    raise UnknownCommand if @program.nil?

    @program.new.respond(params)
  end
end
