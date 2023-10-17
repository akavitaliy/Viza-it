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

accounts = File.open("email.txt")
password = ''

accounts.each do |account|
    6.times do
        start(browser)
        screenshot(browser)
        puts '=' * 20
        puts account 
        puts '=' * 20
        login(browser, account, password)
        begin
            cheak_day(browser, account)
        rescue => exception
            puts exception.message.colorize(:red)
            puts 'Ошибка!'.colorize(:red) 
            sleep 2              
        end                      
    end
end