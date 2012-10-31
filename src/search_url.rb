class SearchURL

	def search_url(type, param)
		"https://github.com/search?&q=#{criteria(param)}&type=#{type}"
	end

	def single_page_url(page_index)
		search_url + "&start_value=#{page_index}"
	end

	def criteria(param)
			param.to_a.inject([]) { |res, pair| res << pair.join("%3A") }.join('+')
	end
end
