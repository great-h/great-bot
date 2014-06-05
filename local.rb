logger = Ruboty.logger
logger.level =  Logger::DEBUG
logger.debug('load: ' + __FILE__)

include Ruboty
AdapterBuilder.adapter_classes << Adapters::Shell

require_relative 'user_script'
