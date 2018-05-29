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
	project_path = "./."
	self.add_property( :browser, "firefox" )
	self.add_property( :version, "66" )
	self.add_property( :platform, "windows" )
	self.add_property( :threads, "1" )
	self.add_property( :remote, false )
	self.add_property( :headless, true )
	self.add_property( :proxy_enabled, false )
	self.add_property( :selenium_hub_url, "http://localhost:4444/wd/hub" )
	self.add_property( :selenium_server_path, "#{project_path}/resources/selenium_server_standalone/selenium-server-standalone-3.9.1.jar" )
	self.add_property( :firefox_driver_path, "#{project_path}/resources/selenium_standalone_binaries/windows/marionette/64bit/geckodriver.exe" )
	self.add_property( :chrome_driver_path, "#{project_path}/resources/selenium_standalone_binaries/windows/googlechrome/64bit/chromedriver.exe" )
	private_class_method :add_property
end