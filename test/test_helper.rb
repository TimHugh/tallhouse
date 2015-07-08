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
Dir[File.join(Environment::ROOT_PATH, 'test', 'test_objects', '**', '*.rb')].each { |f| require f }

class Test < Minitest::Test
end
