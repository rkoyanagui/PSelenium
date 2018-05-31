require File.expand_path("././pilot.rb")
include Screenshot

describe "Google something" do
	context "Milk" do
		it "Queries 'milk'" do
			@driver.navigate.to( "https://www.google.com.br/" )
			q = @driver.find_element( name: "q" )
			q.send_keys( "milk" )
			q.submit
			wait = Selenium::WebDriver::Wait.new
			wait.until do
				@driver.find_element( id: "search" ).displayed?
			end
			RSpec::Matchers.expect( @driver.title ).to eq( "milk - Pesquisa Google" )
			take_screenshot( "google_milk" )
		end
	end
end