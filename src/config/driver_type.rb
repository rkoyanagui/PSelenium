class DriverType include SetupProperties
	def self.add_webdriver_object( browser, webdriver )
		@hash ||= {}
		@hash[browser] = webdriver
	end
	def self.get_webdriver_object( browser )
		@hash[browser]
	end
	self.add_webdriver_object( :FIREFOX, Proc.new do
		Selenium::WebDriver.for( :remote, url: SetupProperties.get_property( :selenium_hub_url ), desired_capabilities: :firefox )
	end )
	self.add_webdriver_object( :CHROME, Proc.new do
		Selenium::WebDriver.for( :remote, url: SetupProperties.get_property( :selenium_hub_url ), desired_capabilities: :chrome )
	end )
	private_class_method :add_webdriver_object
end