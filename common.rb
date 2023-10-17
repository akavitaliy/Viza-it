require_relative 'bot.rb'

def start(browser)    
    browser.goto("https://visa-it.tlscontact.com/by/msq/login.php")
    sleep 1
end

def screenshot(browser)
    loop do
        sleep 3
        if browser.at_css('.container')
            sleep 3
            browser.screenshot(path: "#{Time.now.strftime('%m-%d-%H-%M-%S-%Y')}.png")
            break
        end
    end
end

def login(browser, login, password)   
    loop do
        sleep 1                   
        @time_start = Time.now.strftime('%m-%d-%H:%M:%S')
        puts browser.network.status        
        if browser.at_css('.container')     
            element_login = browser.at_css('input[name=email]')
            element_login.focus
            element_login.type("#{login}", :enter) 

            element_pwd = browser.at_css('input[name=pwd]')
            element_pwd.focus
            element_pwd.type("#{password}", :enter)

            sleep 2
            browser.at_xpath('/html/body/div[3]/form/div/div[2]/div[1]').click
            puts "sleep 7 sec"
            sleep 7
            return puts 'Next'
        end
    end
end

def save_html(browser)
    browser.mhtml(path: "free-#{Time.now.strftime('%m-%d-%H-%M-%S-%Y')}.mhtml")
end

def cheak_day(browser, account)
    numb = 0

    if browser.at_css('.main_message.main_message_')
        puts 'Истекло колличество конектов!'.colorize(:red)        
    else
        loop do
            results = browser.at_css('.take_appointment')
            results.css('a').each do |item|
                puts "#{numb += 1}  " + item.text            
                if p item.attribute('class').to_s == 'appt-table-btn full'
                    puts item.attribute('class').to_s.colorize(:yellow)                                        
                else
                    puts 'Класс изменился!'.colorize(:green)
                    message = "#{item.text.to_s} - #{item.attribute('class').to_s}"
                    bot_send(message)
                    save_html(browser)
                end
            end
            puts "#{@time_start} - " + Time.now.strftime('%m-%d-%H:%M:%S').colorize(:yellow)
            puts account
            puts '=' * 20
            sleep 60
            browser.refresh
            sleep 3
        end
    end     
end