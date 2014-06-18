Ruboty.handlers.delete(Ruboty::Handlers::Ping)

module Ruboty::Handlers
  class PING2 < Base
    on /ping (.*)\z/i, name: 'ping2', description: 'sample ping'
    on /reply_to (.*?) (.*)\z/i, name: 'reply_to', description: 'reply to meesage'

    def ping2(message)
      Ruboty.logger.info("Handle ping2: #{message.body}")
      body = message[1]
      to = message.original[:from]
      Ruboty.escape(body)
      message.reply("@#{to} #{body}")
    end

    def reply_to(message)
      status_id = message[1]
      body = message[2]
      adapter = @robot.send(:adapter)
      if adapter.class == Ruboty::Adapters::Twitter
        tweet = @robot.send(:client).status(status_id)
        name = tweet.user.screen_name
      end
      @robot.say(body: "#{name} #{body}", in_reply_to_status_id: status_id)
    end
  end
end
