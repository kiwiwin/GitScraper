class RepositoryVersion
	def add_file_number(diff)
		count_file_number(diff, 'A')
	end

	def delete_file_number(diff)
		count_file_number(diff, 'D')
	end

	def modify_file_number(diff)
		count_file_number(diff, 'M')
	end

	def count_file_number(diff, operation)
		res = 0		
		diff.split("\n").each do |line|
			if line[0] == operation
				res += 1 
			end
		end
		return res
	end

	def insert_line_number(diff)
		count_line_number(diff)[1].to_i
	end

	def delete_line_number(diff)
		count_line_number(diff)[2].to_i
	end

	def count_line_number(diff)
		/\d+ files changed, (\d+) insertions\(\+\), (\d+) deletions\(-\)/.match(diff)
	end
end
