desc "ward off idling"
task :call_page do
  require 'net/http'
  uri = URI.parse('http://test-app.herokuapp.com/')
  Net::HTTP.start('test-app.herokuapp.com') do |http|
    response = http.head('/')
  end
end
