ENV['RACK_ENV'] = 'test'

require 'dotenv'
Dotenv.load

require 'codeclimate-test-reporter'
SimpleCov.start do
  formatter SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    CodeClimate::TestReporter::Formatter
  ]
end

require 'minitest/autorun'
require 'rack/test'

require_relative '../environment'
require_rel 'test_objects/**/*.rb'

class Test < Minitest::Test
end
