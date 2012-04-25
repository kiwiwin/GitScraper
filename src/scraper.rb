require 'open-uri'

class Scraper

	def initialize(url)
		@url = url
	end

	def element_number
		content = open(@url.search_url).read
		content.match(element_number_match)[1].to_i
	end

	def single_page_elements(page_index)
		content = open(@url.single_page_url(page_index)).read
		content.scan(element_match).flatten
	end

	def page_number
		(1.0 * element_number / page_size).ceil
	end

	def page_size
		30
	end

	def all_elements
		result = []

		page_index = 1;
		while page_index <= page_number
			result += single_page_elements(page_index)
			page_index += 1
		end

		result
	end
end

