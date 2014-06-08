logger = Ruboty.logger
logger.debug('load: ' + __FILE__)

Dir.glob('lib/handlers/**') do |path|
  logger.debug("load: " + path)
  require_relative path
end
