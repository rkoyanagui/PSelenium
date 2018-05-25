class DriverBase
	def setup( browser_name, )

	end
	def initialize
		#@server = Selenium::Server.new( SetupProperties.get_property( :selenium_server_path ) )
		#@server.start
		@factory = DriverFactory.new
		@driver = @factory.get_driver
		google_test
		@factory.quit_driver
		#@server.stop
	end
	def google_test
		@driver.get( "https://www.google.com.br/" )
		@driver.wait( 5 )
	end
end