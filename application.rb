require 'bundler'
Bundler.require

require './program_manager.rb'

module GardenBuddy
  class Application < Sinatra::Base
    get '/sms' do
      message = ProgramManager.new.respond(command, params)
      create_response(message)
    end

    def create_response(message)
      twiml = Twilio::TwiML::Response.new { |r| r.Message message }
      twiml.text
    end

    def command
      params[:Body].split(' ').first
    end
  end
end
