logger = Ruboty.logger
logger.debug("load: " + __FILE__)

require 'open-uri'
require 'json'
require 'date'

module Ruboty
  class PING2 < Handlers::Base
    on /event(.*)\z/i, name: 'event', description: 'next event infomation'
    API_URL = 'http://great-h.github.io/event.json'

    def event(message)
      Ruboty.logger.info("Handle event: #{message.body}")
      to = message.original[:from]
      attributes = JSON.parse(open(API_URL).read)
      no = attributes['no']
      url = 'http://great-h.github.io/events/event-%03d.html' % no
      date = DateTime.parse(attributes['datetime']).strftime('%m月%d日')
      body = "#すごい広島 #{no} は#{date}ですー。 #{url}"
      message.reply(".@#{to} #{body}")
    end
  end
end
