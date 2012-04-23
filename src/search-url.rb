class SearchURL
	def initialize(filter)
		@filter = filter
	end

	def search_url
		"https://github.com/search?&q=#{@filter.criteria}&type=#{@filter.type}"
	end

	def single_page_url(page_index)
		search_url + "&start_value=#{page_index}"
	end
end
