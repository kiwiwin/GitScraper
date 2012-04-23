require File.dirname(__FILE__) + "/../src/search-url"

class StubSearchURL < SearchURL
	def initialize(filename)
		@filename = filename
	end

	def search_url
		@filename
	end

	def single_page_url(page_index)
		@filename
	end
end
