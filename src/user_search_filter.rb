require File.dirname(__FILE__) + "/search_filter"

class UserSearchFilter < SearchFilter
	attr_accessor :location

	def type
		"Users"
	end
end
