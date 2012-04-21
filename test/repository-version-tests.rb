require 'test/unit'
require File.dirname(__FILE__) + '/../src/repository-version'

class RepositoryVersionTests < Test::Unit::TestCase
	def setup
		fixture_dir = File.dirname(__FILE__) + "/fixture"
		@repos_diff_file_content = File.open(fixture_dir + "/repos_diff_file").read
		@repos_diff_line_content = File.open(fixture_dir + "/repos_diff_line").read
		@repos_version = RepositoryVersion.new
	end

	def test_add_file_number
		assert_equal(2, @repos_version.add_file_number(@repos_diff_file_content))	
	end

	def test_delete_file_number
		assert_equal(6, @repos_version.delete_file_number(@repos_diff_file_content))
	end

	def test_modify_file_number
		assert_equal(1, @repos_version.modify_file_number(@repos_diff_file_content))
	end

	def test_insert_line_number
		assert_equal(71, @repos_version.insert_line_number(@repos_diff_line_content))
	end

	def test_delete_line_number
		assert_equal(40, @repos_version.delete_line_number(@repos_diff_line_content))
	end
end
