require File.expand_path("././pilot.rb")
include Screenshot

describe "Google something" do
	context "Cheese" do
		it "Queries 'cheese'" do
			@driver.navigate.to( "https://www.google.com.br/" )
			q = @driver.find_element( name: "q" )
			q.send_keys( "cheese" )
			q.submit
			wait = Selenium::WebDriver::Wait.new
			wait.until do
				@driver.find_element( id: "ires" ).displayed?
			end
			RSpec::Matchers.expect( @driver.title ).to eq( "cheese - Pesquisa Google" )
			take_screenshot( "google_cheese" )
		end
	end
end