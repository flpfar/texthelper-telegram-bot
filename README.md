# TextHelper - Telegram Bot

> This is a telegram bot that manipulates text according to the command provided. Created to practice Ruby.

![Pic](/images/texthelperbot.png)

This Telegram Bot, hosted on Heroku, accepts a command with a text to receive an action. The commands implemented are: /start,
/commands, /upcase, /downcase, /capitalize, /capitalizeall, /countchars, /countonlychars, /countwords

## Built With

- Ruby
- [telegram-bot-ruby](https://github.com/atipugin/telegram-bot-ruby)
- Rubocop (linter)

## Getting started

### Prerequisites
- To run this project, you must have **Ruby** installed (you can get it [here](https://www.ruby-lang.org/pt/documentation/installation/)).
- It is also necessary to have a token for a Bot, that can be generated within Telegram with the BotFather.

### Setup
- Clone this repository to your local machine or download the files.
- Set the environment variable with your token:  `$ export TEXTHELPER_TOKEN=token`

### Usage
- Navigate to the project folder.
- Run the following command on terminal:
   ```
   $ ./bin/main.rb
   ```

### User Interface
- Search for TextHelperBot inside telegram or [access here](https://t.me/texthelperbot)
- When interacting with the bot, the start command will show:

   ```
    Welcome to TextHelper!

    Here you can use 'command sometext' to achieve the desired modification in your text.

    The available commands are: 
    '/start' shows welcome message
    '/commands' shows available commands
    '/upcase text' returns 'TEXT'
    '/downcase TeXt' returns 'text'
    '/capitalize some text' returns 'Some text'
    '/capitalizeall some text' returns 'Some Text'
    '/countchars some text' returns '9' (counting whitespaces)
    '/countonlychars some text' returns '8' (not counting whitespaces)
    '/countwords some text' returns '2'
   ``` 

## 👤 Author 

- Github: [@flpfar](https://github.com/flpfar)
- Twitter: [@flpfar](https://twitter.com/flpfar)
- Linkedin: [Felipe Augusto Rosa](https://www.linkedin.com/in/felipe-augusto-rosa-7b96a4b1)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!
Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!