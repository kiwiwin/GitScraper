require 'test/unit'
require '../src/repository-search-url'

class RepositorySearchURLTests < Test::Unit::TestCase
	def test_search_language_url
		expected_search_url = "https://github.com/search?&q=language%3Ajava&type=Repositories"

		scraper = RepositorySearchURL.new
		scraper.language = "java"

		assert_equal(expected_search_url, scraper.search_url)
	end

	def test_search_size_url
		expected_search_url = "https://github.com/search?&q=size%3A100&type=Repositories"

		scraper = RepositorySearchURL.new
		scraper.size = 100
		
		assert_equal(expected_search_url, scraper.search_url)
	end

	def test_search_size_and_language_url
		expected_search_url = "https://github.com/search?&q=language%3ACsharp+size%3A10&type=Repositories"

		scraper = RepositorySearchURL.new
		scraper.language = "Csharp"
		scraper.size = 10

		assert_equal(expected_search_url, scraper.search_url)
	end

	def test_single_page_url
		expected_search_url = "https://github.com/search?&q=size%3A100&type=Repositories&start_value=3"

		scraper = RepositorySearchURL.new
		scraper.size = 100

		assert_equal(expected_search_url, scraper.single_page_url(3))
	end
end
