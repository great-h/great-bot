require 'newrelic_rpm'

require_relative 'user_script'

require 'thread'
Thread.new do
  app =  -> (env) { [200, {'ContentType' => 'text/html'}, ['すごい広島']] }
  port = ENV["PORT"] || 4000
  Thin::Server.start('0.0.0.0', port, app)
end
