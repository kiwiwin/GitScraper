class CommitsAnalysis
	def changed_file_number(diff)
		match_diff_shortstat(diff)[1].to_i
	end

	def insert_line_number(diff)
		match_diff_shortstat(diff)[2].to_i
	end

	def delete_line_number(diff)
		match_diff_shortstat(diff)[3].to_i
	end

	def match_diff_shortstat(diff)
		/(\d+) files changed, (\d+) insertions\(\+\), (\d+) deletions\(-\)/.match(diff)
	end

	def changed_file_history(git_diff)
		get_history(git_diff, method(:changed_file_number))
	end

	def insert_line_history(git_diff)
		get_history(git_diff, method(:insert_line_number))
	end

	def delete_line_history(git_diff)
		get_history(git_diff, method(:delete_line_number))
	end

	def get_history(git_diff, callback)
		version = 0		
		history = []

		begin
			while true
				history.push( callback.call(git_diff.diff(version+1, version)) )
				version += 1
			end
		rescue Exception => ex
			history.reverse!
		end
	end

end
