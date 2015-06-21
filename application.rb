require 'bundler'
Bundler.require

require './program_manager.rb'

module GardenBuddy
  class Application < Sinatra::Base
    @program_manager = ProgramManager.new

    get '/sms' do
      twiml = Twilio::TwiML::Response.new do |r|
        r.Message "Thanks for watering! 🌻🎉"
      end
      twiml.text
    end
  end
end
