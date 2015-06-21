require 'bundler'
Bundler.require

module GardenBuddy
  class Application < Sinatra::Base
    get '/sms' do
      sender = params[:From]
      twiml = Twilio::TwiML::Response.new do |r|
        r.Message "Thanks for watering! 🌻🎉"
      end
      twiml.text
    end
  end
end
