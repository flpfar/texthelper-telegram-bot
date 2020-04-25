require_relative '../lib/telegram_bot'

token = ENV['TEXTHELPER_TOKEN']
TelegramBot.start_bot(token)
