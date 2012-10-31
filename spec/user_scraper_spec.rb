require_relative "spec_helper"

describe Scraper do
	
	let(:dummy_page_index) {1}

	cases = {
		"blank" => 0,
		"half" => 2,
		"full" => 7755
	}

	cases.each do |fixture, expected_user_number|

		context "when #{fixture} user page" do

			before (:all) do
				@scraper = ScraperTestsHelper.create_scraper_of_stub_url(:user, fixture)
				@user_list = ScraperTestsHelper.load_result_list(:user, fixture)
			end

			it "user number should be #{expected_user_number}" do
				@scraper.element_number.should == expected_user_number
			end

			it "single page users is #{fixture}_user_list" do
				@scraper.single_page_elements(1).should == @user_list
			end

		end

	end

end

