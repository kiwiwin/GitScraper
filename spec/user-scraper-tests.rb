require File.dirname(__FILE__) + "/scraper-tests-helper"

describe UserScraper do
	
	let(:dummy_page_index) {1}

	context "blank user page" do
		before (:all) do
			@blank_page_scraper = ScraperTestsHelper.create_scraper_of_stub_url("UserScraper", "blank")
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
			@half_page_scraper = ScraperTestsHelper.create_scraper_of_stub_url("UserScraper", "half")
			@half_user_list = ScraperTestsHelper.load_result_list("UserScraper", "half")
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
			@full_page_scraper = ScraperTestsHelper.create_scraper_of_stub_url("UserScraper", "full")
			@full_user_list = ScraperTestsHelper.load_result_list("UserScraper", "full")
		end			
		
		it "user number is 7755" do
			@full_page_scraper.element_number.should == 7755
		end

		it "single page users equal to full_user_list" do
			@full_page_scraper.single_page_elements(dummy_page_index).should == @full_user_list
		end

		it "all users equal to full_repository_list" do
# TODO: too large for test, should replace with a smaller repository list
#			@full_page_scraper.all_elements.should == @full_repository_list * 2
		end
	end
end

