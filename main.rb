require 'ferrum'
require 'colorize'
require_relative 'common.rb'

browser = Ferrum::Browser.new(
    browser_path: "/usr/bin/google-chrome", 
    headless: false, 
    browser_options: { "disable-blink-features": "AutomationControlled", 'no-sandbox':nil, 'incognito':nil }, 
    process_timeout: 160
    #xvfb: true,
    #extensions: ['stealth.min.js']    
)

accounts = [
    { login: 'akavitamin_man22@rambler.ru',  password: '' },
    { login: 'akavitamin_man21@rambler.ru',  password: '' },
    { login: 'akavitamin_man20@rambler.ru',  password: '' },
    { login: 'akavitamin_man19@rambler.ru',  password: '' },
    { login: 'akavitamin_man18@rambler.ru',  password: '' },
    { login: 'akavitamin_man17@rambler.ru',  password: '' },
    { login: 'akavitamin_man16@rambler.ru',  password: '' },
    { login: 'akavitamin_man15@rambler.ru',  password: '' },
    { login: 'akavitamin_man14@rambler.ru',  password: '' },
    { login: 'akavitamin_man13@rambler.ru',  password: '' },
    { login: 'akavitamin_man12@rambler.ru',  password: '' },
    { login: 'akavitamin_man11@rambler.ru',  password: '' },
    { login: 'akavitamin_man10@rambler.ru',  password: '' },
    { login: 'akavitamin_man9@rambler.ru',   password: '' },
    { login: 'akavitamin_man8@rambler.ru',   password: '' },
    { login: 'akavitamin_man7@rambler.ru',   password: '' },
    { login: 'akavitamin_man6@rambler.ru',   password: '' },
    { login: 'akavitamin_man5@rambler.ru',   password: '' },
    { login: 'akavitamin_man4@rambler.ru',   password: '' },
    { login: 'akavitamin_man3@rambler.ru',   password: '' },
    { login: 'akavitamin_man2@rambler.ru',   password: '' },
    { login: 'akavitamin_man1@rambler.ru',   password: '' },
    { login: 'akavitamin_man@rambler.ru',    password: '' },
    { login: 'akavitaminman4@gmail.com',     password: '' },
    { login: 'akavitaminman3@gmail.com',     password: '' },
    { login: 'akavitaminman2@gmail.com',     password: '' },
    { login: 'akavitaminman1@gmail.com',     password: '' },
    { login: 'vitaminr2test@gmail.com',      password: '' },
    { login: 'scoundrel98@gmail.com',        password: '' },
    { login: 'vitamin_man@mail.ru',          password: '' },
  ]


accounts.each do |account|
    6.times do
        start(browser)
        screenshot(browser)
        puts '=' * 20
        puts account[:login] 
        puts '=' * 20
        login(browser, account[:login], account[:password])
        begin
            cheak_day(browser)
        rescue => exception
            puts exception.message.colorize(:red)
            puts 'Ошибка!'.colorize(:red) 
            sleep 2              
        end                      
    end
end














# def parser(browser)
#     begin
#         start(browser)
#     rescue => exception
#         puts exception.message
#         parser(browser)
#     end

#     screenshot(browser)

#     login(browser, login, password)

#     begin
#         cheak_day(browser)
#     rescue => exception
#         puts exception.message.colorize(:red)
#         puts 'Ошибка!'.colorize(:red) 
#         gets       
#         sleep 3
#         parser(browser)
#     end

#     gets
#     browser.quit
# end

#parser(browser)
