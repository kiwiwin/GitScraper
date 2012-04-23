require 'test/unit'
require File.dirname(__FILE__) + "/../src/user-search-url"

class UserSearchURLTests < Test::Unit::TestCase
	def test_search_user_location_url
		expected_url = "https://github.com/search?&q=location%3Achina&type=Users"
		
		url = UserSearchURL.new
		url.location = "china"
		assert_equal(expected_url, url.search_url)
	end
end
