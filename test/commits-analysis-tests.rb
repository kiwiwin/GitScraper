require 'test/unit'
require File.dirname(__FILE__) + '/../src/commits-analysis'

class CommitsAnalysisTests < Test::Unit::TestCase
	def setup
		@repos_diff_line_content = "7 files changed, 71 insertions(+), 40 deletions(-)"
		@commits_analysis = CommitsAnalysis.new
		@stub_diff = StubGitDiff.new("anonym_path")
	end

	def test_changed_file_number
		assert_equal(7, @commits_analysis.changed_file_number(@repos_diff_line_content))
	end

	def test_insert_line_number
		assert_equal(71, @commits_analysis.insert_line_number(@repos_diff_line_content))
	end

	def test_delete_line_number
		assert_equal(40, @commits_analysis.delete_line_number(@repos_diff_line_content))
	end

	def test_changed_file_history
		expected_changed_file_history = [8, 7]
		
		assert_equal(expected_changed_file_history, @commits_analysis.changed_file_history(@stub_diff))
	end

	def test_insert_line_history
		expected_insert_line_history = [700, 71]
		
		assert_equal(expected_insert_line_history, @commits_analysis.insert_line_history(@stub_diff))
	end

	def test_delete_line_history
		expected_delete_line_history = [301, 40]

		assert_equal(expected_delete_line_history, @commits_analysis.delete_line_history(@stub_diff))
	end
end

class StubGitDiff
	def initialize(repos_dir)
		@repos_dir = repos_dir
	end

	def diff(from_version, to_version)
		if from_version == 1 && to_version == 0
			"7 files changed, 71 insertions(+), 40 deletions(-)"
		elsif from_version == 2 && to_version == 1
			"8 files changed, 700 insertions(+), 301 deletions(-)"
		else
			raise "invalid revision"
		end
	end
end
