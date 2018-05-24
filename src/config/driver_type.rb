class DriverType include SetupProperties
	def self.add_webdriver_object( browser, webdriver )
		@hash ||= {}
		@hash[browser] = webdriver
	end
	def self.get_webdriver_object( browser )
		@hash[browser]
	end
	self.add_webdriver_object( :FIREFOX, Proc.new do |capabilities|
		driver_path = File.expand_path( SetupProperties.get_property( :firefox_driver_path ) )
		Selenium::WebDriver::Firefox.driver_path = driver_path
		options = Selenium::WebDriver::Firefox::Options.new
		#options.merge( capabilities )
		options.headless! if SetupProperties.get_property( :headless )
		Selenium::WebDriver.for :firefox, options: options
	end )
	self.add_webdriver_object( :CHROME, Proc.new do |capabilities|
		#chrome_preferences = { "profile.password_manager_enabled" => false }
		driver_path = File.expand_path( SetupProperties.get_property( :chrome_driver_path ) )
		Selenium::WebDriver::Chrome.driver_path = driver_path
		options = Selenium::WebDriver::Chrome::Options.new
		#options.merge( capabilities )
		options.headless! if SetupProperties.get_property( :headless )
		options.add_argument( "--no-default-browser-check" )
		options.add_preference( "profile.password_manager_enabled", false )
		Selenium::WebDriver.for :chrome, options: options
	end )
	private_class_method :add_webdriver_object
end