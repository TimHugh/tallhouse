class Program
  def initialize
    @actions = {}
    @responses = {}

    init if methods.include?(:init)
  end

  def respond(params = {})
    @actions.each do |pattern, action|
      return action.call(params) if params[:Body][pattern]
    end
  end

  class << self
    attr_reader :trigger
  end
end
