ENV['RACK_ENV'] = 'test'
require 'dotenv'
Dotenv.load
require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start
require 'minitest/autorun'

require File.absolute_path('environment.rb')

class Test < Minitest::Test
end
