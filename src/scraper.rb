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
		(1..page_number).inject([]) do |elements, page_index|
			elements + single_page_elements(page_index)
		end
	end

	def element_match
		%r{<h2\s+class\s*=\s*"title"\s*>\s*<a\s+href\s*=\s*"/(.*)"\s*>}
	end

	def element_number_match
		%r{<div\s+class\s*=\s*"title"\s*>\w+ \((\d+)\)</div\s*>}
	end

end

