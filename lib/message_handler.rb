class MessageHandler
  COMMAND_LIST = {
    '/start' => proc { 'Welcome to TextHelper!' },
    '/upcase' => proc { |text| text.upcase },
    '/downcase' => proc { |text| text.downcase },
    '/capitalize' => proc { |text| text.capitalize }
  }.freeze

  def handle_message(message)
    command = message.text.split(' ').first
    text = message.text.split(' ')[1..-1].join(' ')
    if COMMAND_LIST[command]
      COMMAND_LIST[command].call(text)
    else
      'Invalid Command!'
    end
  end
end
