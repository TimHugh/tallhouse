module Responder
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    attr_reader :trigger
  end

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
end
