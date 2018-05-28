class DriverBase
	def self.setup
		Thread.current[:driver_factory] = DriverFactory.new
		Thread.current[:driver] = Thread.current[:driver_factory].get_driver
		Thread.current[:driver].manage.timeouts.implicit_wait = 10
	end
	def self.run
		threads ||= []
		threads << Thread.new do
			setup
			yield
			teardown
		end
		threads.each { |thread| thread.join }
	end
	def self.teardown
		Thread.current[:driver_factory].quit_driver
	end

	#def google_cheese
		# describe "Google Something" do
		# 	context "Cheese" do
		# 		it "Searches Google for 'Cheese'"  do
		# 			run do
		# 				driver = Thread.current[:driver]
		# 				driver.get( "https://www.google.com.br/" )
		# 				driver.title.should == "Google"
		# 			end
		# 		end
		# 	end
		# end
	#end
	# def google_test
	# 	run do
	# 		driver = Thread.current[:driver]
	# 		driver.get( "https://www.google.com.br/" )
	# 		puts "AAAAAAA"
	# 	end
	# 	run do
	# 		driver = Thread.current[:driver]
	# 		driver.get( "http://sco.rsinet.com.br/" )
	# 		puts "BBBBBBB"
	# 	end
	# end
end