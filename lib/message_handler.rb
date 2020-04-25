class MessageHandler
  COMMAND_WITH_ARG_LIST = {
    '/start' => proc { WELCOME_MESSAGE },
    '/upcase' => proc { |text| text.upcase },
    '/downcase' => proc { |text| text.downcase },
    '/capitalize' => proc { |text| text.capitalize },
    '/capitalizeall' => proc { |text| text.split(' ').each(&:capitalize!).join(' ') },
    '/countchars' => proc { |text| text.length },
    '/countonlychars' => proc { |text| text.split(' ').join('').length },
    '/countwords' => proc { |text| text.split(' ').size }
  }.freeze

  COMMAND_WITHOUT_ARG_LIST = {
    '/start' => proc { WELCOME_MESSAGE },
    '/commands' => proc { AVAILABLE_COMMANDS }
  }.freeze

  AVAILABLE_COMMANDS = "\n\nThe available *commands* are: "\
                        "\n'/start' shows welcome message"\
                        "\n'/commands' shows available commands"\
                        "\n'/upcase _text_' returns '_TEXT_'"\
                        "\n'/downcase _TeXt_' returns '_text_'"\
                        "\n'/capitalize _some text_' returns '_Some text_'"\
                        "\n'/capitalizeall _some text_' returns '_Some Text_'"\
                        "\n'/countchars _some text_' returns '_9_' (counting whitespaces)"\
                        "\n'/countonlychars _some text_' returns '_8_' (not counting whitespaces)"\
                        "\n'/countwords _some text_' returns '_2_'".freeze

  WELCOME_MESSAGE = ('Welcome to *TextHelper*!'\
                    "\n\nHere you can use '*command* _sometext_' to achieve the desired modification in your text." +
                    AVAILABLE_COMMANDS).freeze

  EMPTY_TEXT_MSG = ('You sent a command with an empty text.'\
                    "To make it work, use: '*command* _text_'" +
                    AVAILABLE_COMMANDS).freeze

  INVALID_COMMAND = ('Invalid Command!' +
                    AVAILABLE_COMMANDS).freeze

  def handle_message(message)
    message_split = message.text.split(' ')
    command = message_split.first
    text = message_split[1..-1].join(' ')

    return INVALID_COMMAND unless COMMAND_WITH_ARG_LIST[command] || COMMAND_WITHOUT_ARG_LIST[command]

    if COMMAND_WITHOUT_ARG_LIST[command]
      COMMAND_WITHOUT_ARG_LIST[command].call
    else
      text.nil? || text == '' ? EMPTY_TEXT_MSG : COMMAND_WITH_ARG_LIST[command].call(text)
    end
  end
end
