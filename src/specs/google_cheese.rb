require File.expand_path("C:/Users/rubem.koyanagui/eclipse-workspace/PSelenium/pilot.rb")

describe "Google something" do
	context "Cheese" do
		it "Queries 'cheese'" do
			@driver.get( "https://www.google.com.br/" )
			q = @driver.find_element( name: "q" )
			q.send_keys( "cheese" )
			q.submit
			RSpec::Matchers.expect( @driver.title ).to eq( "cheese - Pesquisa Google" )
		end
	end
end