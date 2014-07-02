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
      users = []

      adapter_klass = Ruboty::Adapters::Twitter rescue adatper_klass = nil
      if adapter.class == adapter_klass
        tweet = adapter.send(:client).status(status_id)
        users << "@" + tweet.user.screen_name
        users += tweet.text.split.delete_if { |name| not name.match(/^@\w+/) }
      end
      users.uniq!
      Ruboty.escape(body)
      @robot.say(
        body: "#{users.join(' ')} #{body}",
        original: {tweet: tweet})
    end
  end
end
