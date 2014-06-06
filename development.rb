logger = Ruboty.logger
logger.level =  Logger::DEBUG
logger.debug('load: ' + __FILE__)

include Ruboty
AdapterBuilder.adapter_classes << Adapters::Shell

require_relative 'user_script'

# require 'thread'
# thread = Thread.new do
#   app =  -> (env) { [200, {'ContentType' => 'text/html'}, ['すごい広島']] }
#   port = ENV["PORT"] || 4000
#   RackHandler.default.run(port: port)
# end
