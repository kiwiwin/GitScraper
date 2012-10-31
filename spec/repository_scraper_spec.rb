require_relative "spec_helper"

describe Scraper do

	let(:dummy_page_index) {1}

	cases = {
		"blank" => 0,
		"half" => 18,
		"full" => 40
	}

	cases.each do |fixture, expected_repository_number|

		context "when #{fixture} respository page" do

			before (:all) do
				@scraper = ScraperTestsHelper.create_scraper_of_stub_url(:repository, fixture)
				@repository_list = ScraperTestsHelper.load_result_list(:repository, fixture)
			end		

			it "repository number should be #{expected_repository_number}" do
				@scraper.element_number.should == expected_repository_number
			end

			it "single page repositories should be #{fixture}_repository_list" do
				@scraper.single_page_elements(1).should == @repository_list
			end

		end

	end

end
