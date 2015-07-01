require "sauce/capybara"
require "capybara/rspec"

require "capybara"

Capybara.register_driver :selenium do |app|
  capabilities = {
    :version => ENV['version'],
    :browserName => ENV['browserName'],
    :platform => ENV['platform'],
    :name => ENV["name"] || "TO DO"
  }

  url = "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub".strip
  Capybara::Selenium::Driver.new(app,
                                 :browser => :remote, :url => url,
                                 :desired_capabilities => capabilities)
end
Capybara.default_wait_time = 10
Capybara.current_driver = :selenium


RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Capybara::RSpecMatchers
end
