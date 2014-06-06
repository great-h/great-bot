logger = Ruboty.logger
logger.debug('load: ' + __FILE__)

Dir.glob('scripts/**') do |path|
  logger.debug("load: " + path)
  require_relative path
end
