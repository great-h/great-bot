logger = Ruboty.logger
logger.debug("load: " + __FILE__)
module Ruboty
  class PING2 < Handlers::Base
    on /ping (.*)\z/i, name: 'ping2', description: 'sample ping'

    def ping2(message)
      Ruboty.logger.info("Handle ping2: #{message.body}")
      body = message[1]
      to = message.original[:from]
      Ruboty.escape(body)
      message.reply("@#{to} #{body}")
    end
  end
end
