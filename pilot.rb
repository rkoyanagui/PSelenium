gems_path = "C:/Program Files/Ruby24-x64/lib/ruby/gems/2.4.0/gems"
selenium_lib_path = "/selenium-webdriver-3.12.0/lib/selenium"
require "selenium-webdriver"
require "rspec"
require File.expand_path("#{gems_path}#{selenium_lib_path}/server")
require File.expand_path("./src/config/setup_properties")
require File.expand_path("./src/config/driver_type")
require File.expand_path("./src/config/driver_factory")
require File.expand_path("./src/config/driver_base")
DriverBase.new