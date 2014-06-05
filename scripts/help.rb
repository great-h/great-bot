logger = Ruboty.logger
logger.debug("load: " + __FILE__)

module Ruboty
  class Help2 < Handlers::Base
    on /(help|たすけて|助けて)(.*)\z/i, name: 'help', description: 'help'

    URL = 'https://github.com/great-h/great-bot/wiki/help'

    def help(message)
      Ruboty.logger.info("Handle help: #{message.body}")
      to = "@" + message[1]
      to = message.original[:from]
      message.reply("@#{to} ここをみて #{URL}")
    end
  end
end
