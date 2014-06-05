logger = Ruboty.logger
logger.debug("load: " + __FILE__)

module Ruboty
  class Talk < Handlers::Base
    on /talk_to (.*) (.*)\z/i, name: 'talk_to', description: 'talking bot to user'
    on /talk (.*)\z/i, name: 'talk', description: 'talking bot'

    def talk_to(message)
      Ruboty.logger.info("Handle talk_to: #{message.body}")
      to = "@" + message[1]
      body = message[2]
      body.gsub(/@#{env['ROBOT_NAME']}/)
      message.reply("#{to} #{body}")
    end

    def talk(message)
      Ruboty.logger.info("Handle talk: #{message.body}")
      body = message[1]
      body.gsub(/@#{env['ROBOT_NAME']}/)
      message.reply("#{body}")
    end
  end
end
