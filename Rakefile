require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.verbose = true if ARGV.include? "-v"
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
end
task default: :test

task :console do
  require './environment.rb'
  require 'irb'
  ARGV.clear
  IRB.start
end
