class Program
  def initialize
    @actions = {}
    @responses = {}

    self.init if self.methods.include?(:init)
  end

  def respond(params = {})
    @actions.each do |pattern, action|
      if params[:Body][pattern]
        return action.call(params)
      end
    end
  end

  class << self
    attr_reader :command
  end
end
