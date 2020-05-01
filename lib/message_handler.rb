require_relative 'message_helper'

class MessageHandler
  include MessageHelper
  def handle_message(message)
    message_split = message.text.split(' ')
    @command = message_split.first
    @text = message_split[1..-1].join(' ')

    return INVALID_COMMAND unless command_valid?

    call_command
  end

  private

  def command_valid?
    COMMAND_WITH_ARG_LIST[@command] || COMMAND_WITHOUT_ARG_LIST[@command]
  end

  def call_command
    if COMMAND_WITHOUT_ARG_LIST[@command]
      COMMAND_WITHOUT_ARG_LIST[@command].call
    elsif @text.nil? || @text == ''
      EMPTY_TEXT_MSG
    else
      COMMAND_WITH_ARG_LIST[@command].call(@text)
    end
  end
end
