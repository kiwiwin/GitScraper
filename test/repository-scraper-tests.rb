require 'test/unit'
require '../src/repository-search-scraper'
require '../src/repository-search-url'

class RepostiorySearchScraperTests < Test::Unit::TestCase
	def setup
		@blank_repos_scraper = RepositoryScraper.new(StubRepositorySearchURL.new("./fixture/blank_repository_page.html"))
		@half_repos_scraper = RepositoryScraper.new(StubRepositorySearchURL.new("./fixture/half_repository_page.html"))
		@full_repos_scraper = RepositoryScraper.new(StubRepositorySearchURL.new("./fixture/full_repository_page.html"))
	end

	def test_blank_repository_number
		assert_equal(0, @blank_repos_scraper.repository_number)
	end

	def test_half_repository_number
		assert_equal(18, @half_repos_scraper.repository_number)
	end

	def test_full_repository_number
		assert_equal(40, @full_repos_scraper.repository_number)
	end

	def test_blank_single_page_repositories
		assert_equal([], @blank_repos_scraper.single_page_repositories(1))
	end

	def test_half_single_page_repositories
		expected_repos = read_repository_list_from_file("./fixture/half_repository_list")

		assert_equal(expected_repos, @half_repos_scraper.single_page_repositories(1))
	end

	def test_full_single_page_repostiories
		expected_repos = read_repository_list_from_file("./fixture/full_repository_list")

		assert_equal(expected_repos, @full_repos_scraper.single_page_repositories(1))
	end

	def test_blank_all_repositories
		assert_equal([], @blank_repos_scraper.all_repositories)
	end

	def test_half_all_repositories
		expected_repos = read_repository_list_from_file("./fixture/half_repository_list")

		assert_equal(expected_repos, @half_repos_scraper.all_repositories)
	end

	def test_full_all_repositories
		expected_repos = read_repository_list_from_file("./fixture/full_repository_list") * 2

		assert_array_equal(expected_repos, @full_repos_scraper.all_repositories)
	end

	def test_blank_repositories_page_number
		assert_equal(0, @blank_repos_scraper.page_number)
	end

	def test_half_repositroies_page_number
		assert_equal(1, @half_repos_scraper.page_number)
	end

	def test_full_repositories_page_number
		assert_equal(2 , @full_repos_scraper.page_number)
	end

	def read_repository_list_from_file(filename)
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

class StubRepositorySearchURL < RepositorySearchURL
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
