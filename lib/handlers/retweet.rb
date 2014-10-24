module Ruboty::Handlers
  class Retweet < Base
    on /(RT|retweet) (.*)\z/i, name: "retweet", description: "Retweet"

    def retweet(message)
      Ruboty.logger.info("Handle retweet: #{message.body}")
      tweet_to_be_retweeted = extract_tweet(message)
      to = message.original[:from]
      adapter = @robot.send(:adapter)

      adapter_klass = Ruboty::Adapters::Twitter rescue adatper_klass = nil
      if adapter.class == adapter_klass
        client = adapter.send(:client)
        begin
          client.retweet tweet_to_be_retweeted
        rescue Twitter::Error::NotFound
          message.reply("@#{to} tweet #{tweet_to_be_retweeted} を RT しようとして失敗しました。")
        end
      end
    end

    def extract_url(s, tweet)
      return s unless tweet.urls?
      tweet.urls.each do |uri|
        s.gsub!(uri.url.to_s, uri.expanded_url.to_s)
      end
      s
    end

    def extract_tweet(message)
      extract_url(message[2], message.original[:tweet])
    end
  end
end
