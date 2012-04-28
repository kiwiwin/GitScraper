require File.dirname(__FILE__) + "/search-filter"

class UserSearchFilter < SearchFilter
	attr_accessor :location

	def type
		"Users"
	end
end
