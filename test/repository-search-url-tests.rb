require 'test/unit'
require File.dirname(__FILE__) + '/../src/search-url'
require File.dirname(__FILE__) + '/../src/repository-filter'

class RepositoryURLTests < Test::Unit::TestCase
	def test_search_language_url
		expected_search_url = "https://github.com/search?&q=language%3Ajava&type=Repositories"

		filter = RepositorySearchFilter.new
		filter.language = "java"
		url = SearchURL.new(filter)

		assert_equal(expected_search_url, url.search_url)
	end

	def test_search_size_url
		expected_search_url = "https://github.com/search?&q=size%3A100&type=Repositories"

		filter = RepositorySearchFilter.new
		filter.size = 100
		url = SearchURL.new(filter)
		
		assert_equal(expected_search_url, url.search_url)
	end

	def test_search_size_and_language_url
		expected_search_url = "https://github.com/search?&q=language%3ACsharp+size%3A10&type=Repositories"


		filter = RepositorySearchFilter.new
		filter.language = "Csharp"
		filter.size = 10
		url = SearchURL.new(filter)

		assert_equal(expected_search_url, url.search_url)
	end

	def test_single_page_url
		expected_search_url = "https://github.com/search?&q=size%3A100&type=Repositories&start_value=3"
		
		filter = RepositorySearchFilter.new
		filter.size = 100
		url = SearchURL.new(filter)

		assert_equal(expected_search_url, url.single_page_url(3))
	end
end
