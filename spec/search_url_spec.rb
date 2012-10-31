require_relative "spec_helper"

describe SearchURL do
	
	it "verify search_users_url whose location is china" do
			SearchURL.new(:users, :location => "china").search_url.should == "https://github.com/search?&q=location%3Achina&type=Users"
	end

	it "verify search_repositories_url whose language is csharp and size is 10" do
			SearchURL.new(:repositories, :language => "Csharp", :size => 10).search_url.should == "https://github.com/search?&q=language%3ACsharp+size%3A10&type=Repositories"
	end

end
