class GitDiff
	def initialize(git_dir)
		@git_dir = git_dir
	end

	def diff(from_version, to_version)
		diff_info = `git --git-dir=#{@git_dir}/.git diff --shortstat HEAD~#{from_version} HEAD~#{to_version} 2> /dev/null`
		if diff_info == ""
			raise "invalid revision"
		end
		diff_info
	end
end
