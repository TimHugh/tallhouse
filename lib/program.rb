class Program
  class << self
    attr_reader :trigger
  end

  def initialize
    init if methods.include?(:init)
  end

  def action(trigger, &block)
    @actions = {} if @actions.nil?
    fail if @actions.keys.include? trigger
    @actions[trigger] = block
  end

  def respond(params = {})
    body = params['Body']
    @actions.each do |pattern, action|
      return action.call(params) if body[pattern]
    end
  end
end
