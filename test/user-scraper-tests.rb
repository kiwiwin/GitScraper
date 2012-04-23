require 'test/unit'
require File.dirname(__FILE__) + "/../src/user-scraper"
require File.dirname(__FILE__) + "/../src/user-filter"
require File.dirname(__FILE__) + "/stub-search-url"

class UserScraperTests < Test::Unit::TestCase
	def setup
		@fixture_dir = File.dirname(__FILE__) + "/fixture"

		@blank_user_scraper = UserScraper.new(StubSearchURL.new("#{@fixture_dir}/blank_user_page.html"))
		@half_user_scraper = UserScraper.new(StubSearchURL.new("#{@fixture_dir}/half_user_page.html"))
		@full_user_scraper = UserScraper.new(StubSearchURL.new("#{@fixture_dir}/full_user_page.html"))
	end

	def test_blank_user_number
		assert_equal(0, @blank_user_scraper.element_number)
	end

	def test_half_user_number
		assert_equal(2, @half_user_scraper.element_number)
	end

	def test_full_user_number
		assert_equal(7721, @full_user_scraper.element_number)
	end

	def test_blank_all_users
		assert_equal([], @blank_user_scraper.all_elements)
	end

	def test_half_all_users
		expected_repos = read_user_list_from_file("#{@fixture_dir}/half_user_list")

		assert_array_equal(expected_repos, @half_user_scraper.all_elements)
	end

	def test_blank_single_page_users
		assert_equal([], @blank_user_scraper.single_page_elements(1))
	end

	def test_half_single_page_users
		expected_users = read_user_list_from_file("#{@fixture_dir}/half_user_list")

		assert_array_equal(expected_users, @half_user_scraper.single_page_elements(1))
	end

	def test_full_single_page_users
		expected_users = read_user_list_from_file("#{@fixture_dir}/full_user_list")

		assert_array_equal(expected_users, @full_user_scraper.single_page_elements(1))
	end

	def test_blank_users_page_number
		assert_equal(0, @blank_user_scraper.page_number)
	end

	def test_half_users_page_number
		assert_equal(1, @half_user_scraper.page_number)
	end

	def test_full_users_page_number
		assert_equal(258 , @full_user_scraper.page_number)
	end

	def read_user_list_from_file(filename)
		File.open(filename).readlines.collect do |line|
			line.chomp
		end
	end

	def assert_array_equal(expected, actual)
		assert_equal(expected.size, actual.size, "expected array size = #{expected.size}, but actual array size = #{actual.size}")
		0.upto(expected.size-1) {
			|index|
			assert_equal(expected[index], actual[index], "expected[#{index}] = #{expected[index]}, but actual[#{index}] = #{actual[index]}")
		}
	end

end

