require 'test/unit'

require File.dirname(__FILE__) + "/../src/search-url"
require File.dirname(__FILE__) + "/../src/user-filter"

class UserSearchURLTests < Test::Unit::TestCase
	def test_search_user_location_url
		expected_url = "https://github.com/search?&q=location%3Achina&type=Users"
		
		filter = UserSearchFilter.new
		filter.location = "china"
		url = SearchURL.new(filter)

		assert_equal(expected_url, url.search_url)
	end

	def test_single_user_page_url
		expected_url = "https://github.com/search?&q=location%3Ausa&type=Users&start_value=4"

		filter = UserSearchFilter.new
		filter.location = "usa"
		url = SearchURL.new(filter)

		assert_equal(expected_url, url.single_page_url(4))
	end
end
