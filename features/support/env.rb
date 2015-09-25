require "selenium/webdriver"
require 'capybara/cucumber'
require "sauce"
require "byebug"
require 'sauce/capybara'




Capybara.default_selector = :css
Capybara.run_server = false
Capybara.default_driver = :sauce
Capybara.javascript_driver = :selenium
Capybara.default_max_wait_time = 10



Sauce.config do |config|
  config[:name] = "Cucumber Test"
  config[:start_tunnel] = false
    # Configure OnDemand Platform(s)
  config[:browsers] = [
    ["Windows 7", "Firefox", "26"],
    #["Windows 8", "Internet Explorer", "10"]
    ]
end