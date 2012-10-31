class SearchURL

	def initialize(type, param)
		@type = type
		@param = param
	end

	def search_url
		"https://github.com/search?&q=#{criteria}&type=#{@type.to_s.capitalize}"
	end

	def single_page_url(page_index)
		search_url + "&start_value=#{page_index}"
	end

	def criteria
			@param.to_a.inject([]) { |res, pair| res << pair.join("%3A") }.join('+')
	end

end
