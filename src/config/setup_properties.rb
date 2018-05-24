module SetupProperties
	def self.add_property( key, value )
		@properties ||= {}
		@properties[key] = value
	end
	def self.get_property( key )
		@properties[key]
	end
	def self.set_property( key, value )
		@properties[key] = value unless @properties[key].nil?
	end
	self.add_property( :browser, "chrome" )
	self.add_property( :threads, "1" )
	self.add_property( :remote, false )
	self.add_property( :headless, false )
	self.add_property( :proxy_enabled, false )
	self.add_property( :firefox_driver_path, "C:/Users/rubem.koyanagui/eclipse-workspace/RSelenium/resources/selenium_standalone_binaries/windows/marionette/64bit/geckodriver.exe" )
	self.add_property( :chrome_driver_path, "C:/Users/rubem.koyanagui/eclipse-workspace/RSelenium/resources/selenium_standalone_binaries/windows/googlechrome/64bit/chromedriver.exe" )
	private_class_method :add_property
end