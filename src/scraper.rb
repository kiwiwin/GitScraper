require 'open-uri'
require 'nokogiri'

class Scraper

	def initialize(url)
		@url = url
	end

	def element_number
		page = Nokogiri::HTML(open(@url.search_url))
		page.css("div[class=title]").text.scan(/\((\d+)\)/).flatten[0].to_i
	end

	def single_page_elements(page_index)
		page = Nokogiri::HTML(open(@url.single_page_url(page_index)))
		page.css("h2[class=title]").css("a").collect { |element| element["href"][1..-1] }
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

end

