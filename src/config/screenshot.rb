module Screenshot
	def take_screenshot( test_name )
		path = SetupProperties.get_property( :screenshot_path )
		time = Time.now.strftime( "%Y-%m-%d_%H.%M.%S" )
		@driver.save_screenshot( "#{path}/#{test_name}_#{time}.png" )
	end
end