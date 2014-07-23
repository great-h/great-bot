logger = Ruboty.logger

if ENV['RUBOTY_ENV'] == 'development'
  logger.level =  Logger::DEBUG
else
  require 'newrelic_rpm'
  Ruboty.handlers = Ruboty.handlers - [Ruboty::Handlers::Help]
end

logger.debug('load: ' + __FILE__)

Dir.glob("lib/handlers/**.rb") do |path|
  logger.debug("load: " + path)
  require_relative path
end
