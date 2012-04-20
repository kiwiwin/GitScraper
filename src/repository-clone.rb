class RepositoryClone	
	def clone(git)
		`git clone git@github.com:#{git}.git "#{File.dirname(__FILE__)}/../data/#{git}"`
	end
end
