logger = Ruboty.logger
logger.debug('load: ' + __FILE__)

Dir.glob('scripts/**') do |path|
  require_relative path
end
