require_relative "spec_helper"

describe SearchURL do
	
	it "verify search_users_url whose location is china" do
			SearchURL.new.search_url(:Users, :location => "china").should == "https://github.com/search?&q=location%3Achina&type=Users"
	end

	it "verify search_repositories_url whose language is csharp and size is 10" do
			SearchURL.new.search_url(:Repositories, :language => "Csharp", :size => 10).should == "https://github.com/search?&q=language%3ACsharp+size%3A10&type=Repositories"
	end

end
