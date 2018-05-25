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
	def self.add_browser( value )
		@BROWSERS ||= []
		@BROWSERS << value
	end
	project_path = "C:/Users/rubem.koyanagui/eclipse-workspace/RSelenium"
	self.add_property( :is_single_browser_setup, true )
	self.add_property( :browser, "chrome" )
	self.add_property( :version, "66" )
	self.add_property( :platform, "windows" )
	self.add_property( :threads, "1" )
	self.add_property( :remote, false )
	self.add_property( :headless, false )
	self.add_property( :proxy_enabled, false )
	self.add_property( :selenium_server_path, "#{project_path}/resources/selenium_server_standalone/selenium-server-standalone-3.9.1.jar" )
	self.add_property( :firefox_driver_path, "#{project_path}/resources/selenium_standalone_binaries/windows/marionette/64bit/geckodriver.exe" )
	self.add_property( :chrome_driver_path, "#{project_path}/resources/selenium_standalone_binaries/windows/googlechrome/64bit/chromedriver.exe" )
	unless self.get_property[:is_single_browser_setup]
		do
			self.add_browser( { browser:"firefox", version:"49", platform:"windows_nt" } )
			self.add_browser( { browser:"chrome", version:"66", platform:"windows" } )
		end
	end
	private_class_method :add_property, :add_browser
end