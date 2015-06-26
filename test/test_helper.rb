ENV['RACK_ENV'] = 'test'

require 'dotenv'
Dotenv.load

require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'minitest/autorun'
require 'rack/test'
require 'pry'

require File.absolute_path('environment.rb')

class Test < Minitest::Test
  include Rack::Test::Methods

  def app
    Application
  end
end
