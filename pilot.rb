gems_path = "C:/Program Files/Ruby24-x64/lib/ruby/gems/2.4.0/gems"
selenium_lib_path = "/selenium-webdriver-3.12.0/lib/selenium"
require "rubygems"
require "selenium-webdriver"
require "rspec"
include RSpec::Matchers
require File.expand_path("./src/config/setup_properties")
require File.expand_path("./src/config/driver_type")
require File.expand_path("./src/config/driver_factory")
require File.expand_path("./src/config/driver_base")
require File.expand_path("./src/pages/google_home_page")

RSpec.configure do |config|

  config.before(:each) do
    DriverBase.setup
    @driver = Thread.current[:driver]
  end

  config.after(:each) do
    DriverBase.teardown
  end

end