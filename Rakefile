task default: :test

require 'rake/testtask'
Rake::TestTask.new(:test) do |t|
  t.verbose = true if ARGV.include? '-v'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
end

task c: :console
task :console do
  # load environment config
  require 'dotenv'
  Dotenv.load

  # load application
  require_relative 'environment'

  # launch IRB
  require 'irb'
  ARGV.clear
  IRB.start
end
