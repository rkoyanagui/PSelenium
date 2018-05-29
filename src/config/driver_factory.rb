class DriverFactory include SetupProperties
	def initialize
		defaultbrowser = :FIREFOX
		begin
			browser = SetupProperties.get_property( :browser )
			raise ArgumentError if browser.nil?
			@browser = browser.upcase.to_sym
		rescue ArgumentError
			puts "No driver specified, defaulting to '#{defaultbrowser}'."
			@browser = defaultbrowser
		end
		begin
			@selected_driver_type = DriverType.get_webdriver_object( @browser )
			raise KeyError if @selected_driver_type.nil?
		rescue KeyError
			puts "Unknown driver specified, defaulting to '#{defaultbrowser}'."
			@selected_driver_type = DriverType.get_webdriver_object( defaultbrowser )
		end
	end
	def get_driver
		@driver ||= instantiate_webdriver( @selected_driver_type )
		@driver
	end
	def get_stored_driver
		@driver
	end
	def quit_driver
		unless @driver.nil?
			@driver.quit
			@driver = nil
		end
	end
	def instantiate_webdriver( driver_type )
		driver_type.call
	end
	private :instantiate_webdriver
end