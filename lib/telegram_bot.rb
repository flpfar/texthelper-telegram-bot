require 'telegram/bot'
require_relative 'message_handler'
require_relative 'message_helper'
# rubocop:disable all
class TelegramBot
  def self.start_bot(token)
    message_handler = MessageHandler.new
    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        case message
        when Telegram::Bot::Types::InlineQuery
          query = message.query
          if query && !query.empty?
            results = MessageHelper::COMMAND_WITH_ARG_LIST.map.with_index do |(key, value), index| 
              result = value.call(query)
              Telegram::Bot::Types::InlineQueryResultArticle.new(
                id: index,
                title: key,
                description: result,
                input_message_content: Telegram::Bot::Types::InputTextMessageContent.new(message_text: result)
              )
            end
            bot.api.answer_inline_query(inline_query_id: message.id, results: results)
          end
        when Telegram::Bot::Types::Message
          if message.chat.type != 'group'
            response = message_handler.handle_message(message)
            msg_text = { chat_id: message.chat.id, text: response, parse_mode: 'Markdown' }
            bot.api.send_message(msg_text)
          end
        end
      end
    end
  end
end
