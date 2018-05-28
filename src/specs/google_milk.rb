require File.expand_path("C:/Users/rubem.koyanagui/eclipse-workspace/PSelenium/pilot.rb")

describe "Google something" do
	context "Milk" do
		it "Queries 'milk'" do
			@driver.get( "https://www.google.com.br/" )
			q = @driver.find_element( name: "q" )
			q.send_keys( "milk" )
			q.submit
			RSpec::Matchers.expect( @driver.title ).to eq( "milk - Pesquisa Google" )
		end
	end
end