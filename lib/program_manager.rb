require_rel 'program/programs/**/*.rb'

class ProgramManager
  class UnknownCommand < RuntimeError; end
  class MissingCommand < RuntimeError; end

  attr_reader :programs

  def initialize
    @programs = {}
    Programs.constants.each do |constant|
      next if constant.to_s[/.*Program$/].nil?
      program = Programs.const_get(constant)
      @programs[program.trigger] = program
    end
  end

  def respond(params = {})
    body = params[:Body]
    fail MissingCommand if body.nil? || body.strip.empty?

    @programs.keys.each do |trigger|
      if body.match(trigger)
        @program = @programs[trigger]
        break
      end
    end
    fail UnknownCommand if @program.nil?
    @program.new.respond(params)
  end
end
