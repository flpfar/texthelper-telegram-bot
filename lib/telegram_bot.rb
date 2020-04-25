require 'telegram/bot'
require_relative 'message_handler'

class TelegramBot
  def self.start_bot(token)
    message_handler = MessageHandler.new
    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        response = message_handler.handle_message(message)
        msg_text = { chat_id: message.chat.id, text: response, parse_mode: 'Markdown' }
        bot.api.send_message(msg_text)
      end
    end
  end
end
