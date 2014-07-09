module Ruboty::Handlers
  class Sudden < Base
    on /突然の(.*)\z/i, name: "sudden", description: "sudden something"

    def sudden(message)
      Ruboty.logger.info("Handle sudden: #{message.body}")
      body = message[1]
      Ruboty.escape(body)
      message.reply("#{suddenize(body)}")
    end

    def suddenize(string)
      len = string.each_char.inject(0) do |total, char|
        char.ascii_only? ? total + 1 : total + 2
      end
      top = "人" * (len / 2 + 2)
      bottom = "^Y" * (len / 2 + 1)
      <<-STRING.chop
＿#{top}＿
＞　#{string}　＜
￣Y#{bottom}￣
      STRING
    end
  end
end
