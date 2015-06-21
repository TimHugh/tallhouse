ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'

require File.absolute_path('environment.rb')

class Test < Minitest::Test
end
