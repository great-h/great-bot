logger = Ruboty.logger
logger.debug("load: " + __FILE__)

module Ruboty
  def self.escape(str)
    str.gsub!(/@\w+/,'')
  end

  class Talk < Handlers::Base
    on /talk_to (.*?) (.*)\z/i, name: 'talk_to', description: 'talking bot to user'
    on /talk (.*)\z/i, name: 'talk', description: 'talking bot'

    def talk_to(message)
      Ruboty.logger.info("Handle talk_to: #{message.body}")
      if message[1] == message.robot.name
        to = message.original[:from]
        message.reply("@#{to} なにをさせようとしてるのかなぁ？")
        return
      end
      to = "@" + message[1]
      body = message[2]
      Ruboty.escape(body)
      message.reply("#{to} #{body}")
    end

    def talk(message)
      Ruboty.logger.info("Handle talk: #{message.body}")
      body = message[1]
      Ruboty.escape(body)
      message.reply("#{body}")
    end
  end
end
