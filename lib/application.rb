class Application < Sinatra::Base
  get '/' do
    redirect 'http://github.com/timhugh/tallhouse'
  end

  get '/sms' do
    create_response(dispatch_message(params))
  end

  def dispatch_message(message_params)
    Response.new(message_params)
  end

  def create_response(message)
    twiml = Twilio::TwiML::Response.new { |r| r.Message message }
    twiml.text
  end
end
