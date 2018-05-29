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
end