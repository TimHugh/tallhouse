class ProgramManager
  class UnknownCommand < RuntimeError; end
  class MissingCommand < RuntimeError; end

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
    body = params[:Body]
    raise MissingCommand if body.nil? || body.strip!.empty?
    body.downcase!

    @programs.keys.each do |command|
      if body[/#{command}/]
        @program = @programs[command]
        break
      end
    end
    raise UnknownCommand if @program.nil?
    @program.new.respond(params)
  end
end
