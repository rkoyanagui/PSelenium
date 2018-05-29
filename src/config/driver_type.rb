class DriverType include SetupProperties
	def self.add_webdriver_object( browser, webdriver )
		@hash ||= {}
		@hash[browser] = webdriver
	end
	def self.get_webdriver_object( browser )
		@hash[browser]
	end
	self.add_webdriver_object( :FIREFOX, Proc.new do
		profile = Selenium::WebDriver::Firefox::Profile.from_name "default"
		caps = Selenium::WebDriver::Remote::Capabilities.firefox(firefox_profile: profile)
		Selenium::WebDriver.for( :remote, url: SetupProperties.get_property( :selenium_hub_url ), desired_capabilities: caps )
	end )
	self.add_webdriver_object( :CHROME, Proc.new do
		Selenium::WebDriver.for( :remote, url: SetupProperties.get_property( :selenium_hub_url ), desired_capabilities: :chrome )
	end )
	private_class_method :add_webdriver_object
end