if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  task :default => :spec
end

desc "ward off idling"
task :call_page do
  require 'net/http'
  Net::HTTP.start('great-bot.herokuapp.com') do |http|
    response = http.head('/')
  end
end
