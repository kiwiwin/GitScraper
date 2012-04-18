require 'test/unit'
require '../src/repository-search-scraper'

class RepostiorySearchScraperTests < Test::Unit::TestCase
	def setup
		blank_repos = File.open("./fixture/blank_repository_page.html").read		
		half_repos = File.open("./fixture/half_repository_page.html").read
		full_repos = File.open("./fixture/full_repository_page.html").read		

		@blank_repos_scraper = RepositorySearchScraper.new(blank_repos)
		@half_repos_scraper = RepositorySearchScraper.new(half_repos)
		@full_repos_scraper = RepositorySearchScraper.new(full_repos)
	end

	def test_blank_repository_number
		assert_equal(0, @blank_repos_scraper.repository_num)
	end

	def test_half_repository_number
		assert_equal(18, @half_repos_scraper.repository_num)
	end

	def test_full_repository_number
		assert_equal(23716, @full_repos_scraper.repository_num)
	end

	def test_blank_repositories
		assert_equal([], @blank_repos_scraper.repositories)
	end

	def test_half_repositories
		expected_repos = read_repository_list_from_file("./fixture/half_repository_list")

		assert_equal(expected_repos, @half_repos_scraper.repositories)
	end

	def test_full_repostiories
		expected_repos = read_repository_list_from_file("./fixture/full_repository_list")

		assert_equal(expected_repos, @full_repos_scraper.repositories)
	end

	def read_repository_list_from_file(filename)
		File.open(filename).readlines.collect do |line|
			line.chomp
		end
	end
end
