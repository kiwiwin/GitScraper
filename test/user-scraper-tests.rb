require 'test/unit'
require File.dirname(__FILE__) + "/../src/user-scraper"
require File.dirname(__FILE__) + "/../src/user-search-url"

class UserScraperTests < Test::Unit::TestCase
	def setup
		@fixture_dir = File.dirname(__FILE__) + "/fixture"

		@blank_user_scraper = UserScraper.new(StubUserSearchURL.new("#{@fixture_dir}/blank_user_page.html"))
		@half_user_scraper = UserScraper.new(StubUserSearchURL.new("#{@fixture_dir}/half_user_page.html"))
		@full_user_scraper = UserScraper.new(StubUserSearchURL.new("#{@fixture_dir}/full_user_page.html"))
	end

	def test_blank_user_number
		assert_equal(0, @blank_user_scraper.user_number)
	end

	def test_half_user_number
		assert_equal(2, @half_user_scraper.user_number)
	end

	def test_full_user_number
		assert_equal(7721, @full_user_scraper.user_number)
	end
end

class StubUserSearchURL < UserSearchURL
	def initialize(filename)
		@filename = filename
	end

	def search_url
		@filename
	end

	def single_page_url(page_index)
		@filename
	end
end
