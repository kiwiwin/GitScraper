require File.dirname(__FILE__) + "/search-filter"

class RepositorySearchFilter < SearchFilter
	attr_accessor :language
	attr_accessor :size
	attr_accessor :forks
	attr_accessor :fork
	attr_accessor :pushed
	attr_accessor :username
	attr_accessor :created
	attr_accessor :followres
	attr_accessor :actions

	def type
		"Repositories"
	end
end
