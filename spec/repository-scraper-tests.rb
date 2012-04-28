require File.dirname(__FILE__) + "/scraper-tests-helper"

describe RepositoryScraper do

	let(:dummy_page_index) {1}

	context "blank repository page" do
		before (:all) do
			@blank_page_scraper = ScraperTestsHelper.create_scraper_of_stub_url("RepositoryScraper", "blank")
		end

		it "repository number is 0" do
			@blank_page_scraper.element_number.should == 0
		end

		it "single page repositories is []" do
			@blank_page_scraper.single_page_elements(1).should == []
		end

		it "all repositories is []" do
			@blank_page_scraper.all_elements.should == []
		end
	end

	context "half repositories page" do
		before (:all) do
			@half_page_scraper = ScraperTestsHelper.create_scraper_of_stub_url("RepositoryScraper", "half")
			@half_repository_list = ScraperTestsHelper.load_result_list("RepositoryScraper", "half")
		end

		it "repository number is 18" do
			@half_page_scraper.element_number.should == 18
		end

		it "single page repositories equal to half_repository_list" do
			@half_page_scraper.single_page_elements(dummy_page_index).should == @half_repository_list
		end

		it "all repositories equal to half_repository_list" do
			@half_page_scraper.all_elements.should == @half_repository_list
		end
	end

	context "full repositories page" do
		before (:all) do
			@full_page_scraper = ScraperTestsHelper.create_scraper_of_stub_url("RepositoryScraper", "full")
			@full_repository_list = ScraperTestsHelper.load_result_list("RepositoryScraper", "full")
		end			
		
		it "repository number is 40" do
			@full_page_scraper.element_number.should == 40
		end

		it "single page repositories equal to full_repository_list" do
			@full_page_scraper.single_page_elements(dummy_page_index).should == @full_repository_list
		end

		it "all repositories equal to full_repository_list" do
			@full_page_scraper.all_elements.should == @full_repository_list * 2
		end
	end
end
