require File.dirname(__FILE__) + "/../src/user-scraper"
require File.dirname(__FILE__) + "/stub-search-url"

describe UserScraper do
	
	def create_scraper_of_stub_url(fixture_name)
		UserScraper.new(StubSearchURL.new("#{File.dirname(__FILE__)}/fixture/#{fixture_name}_user_page.html")) 
	end

	def load_user_list(fixture_name)
		File.open("#{File.dirname(__FILE__)}/fixture/#{fixture_name}_user_list").readlines.collect {
 			|line|
			line.chomp
		}
	end

	let(:dummy_page_index) {1}

	context "blank user page" do
		before (:all) do
			@blank_page_scraper = create_scraper_of_stub_url("blank")
		end

		it "user number is 0" do
			@blank_page_scraper.element_number.should == 0
		end

		it "single page users is []" do
			@blank_page_scraper.single_page_elements(1).should == []
		end

		it "all users is []" do
			@blank_page_scraper.all_elements.should == []
		end

	end

	context "half repositories page" do
		before (:all) do
			@half_page_scraper = create_scraper_of_stub_url("half")
			@half_user_list = load_user_list("half")
		end

		it "repository number is 2" do
			@half_page_scraper.element_number.should == 2
		end

		it "single page users equal to half_user_list" do
			@half_page_scraper.single_page_elements(dummy_page_index).should == @half_user_list
		end

		it "all users equal to half_user_list" do
			@half_page_scraper.all_elements.should == @half_user_list
		end
	end

	context "full users page" do
		before (:all) do
			@full_page_scraper = create_scraper_of_stub_url("full")
			@full_user_list = load_user_list("full")
		end			
		
		it "user number is 7755" do
			@full_page_scraper.element_number.should == 7755
		end

		it "single page users equal to full_user_list" do
			@full_page_scraper.single_page_elements(dummy_page_index).should == @full_user_list
		end

		it "all users equal to full_repository_list" do
# too large for test
#			@full_page_scraper.all_elements.should == @full_repository_list * 2
		end
	end
end

