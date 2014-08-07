module Ruboty::Handlers
  class Sudden < Base
    on /(RT|retweet) (.*)\z/i, name: "retweet", description: "Retweet"

    def retweet(message)
      Ruboty.logger.info("Handle retweet: #{message.body}")
      tweet_id = message[2]
      to = message.original[:from]
      adapter = @robot.send(:adapter)

      adapter_klass = Ruboty::Adapters::Twitter rescue adatper_klass = nil
      if adapter.class == adapter_klass
        client = adapter.send(:client)
        begin
          client.retweet tweet_id
        rescue Twitter::Error::NotFound
          message.reply("@#{to} tweet ID #{message[2]} を RT しようとして失敗しました。")
        end
      end
    end
  end
end
