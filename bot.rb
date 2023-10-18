require 'telegram/bot'

@token = ''

def bot_send(message)    
    Telegram::Bot::Client.run(@token) do |bot|
        bot.api.send_message(chat_id: '-1001720656949', text: "Свободные даты #{message}")   
    end    

    return "OK"
end
