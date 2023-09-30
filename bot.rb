require 'telegram/bot'

@token = '6395073876:AAFqb-fk2AMn6qoVC3jWiFVq9nZ-AFfxjWY'

def bot_send(message)    
    Telegram::Bot::Client.run(@token) do |bot|
        bot.api.send_message(chat_id: '-1001720656949', text: "#{message}")   
    end    

    return "OK"
end