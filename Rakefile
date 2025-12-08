require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

desc 'Run a specific day solution'
task :run, [:day] do |t, args|
  day = args[:day] || '1'
  require_relative "lib/day#{day}"
  puts "Running Day #{day}..."
  Day = Object.const_get("Day#{day}")
  Day.run
end
