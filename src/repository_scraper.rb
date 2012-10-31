require 'open-uri'
require File.dirname(__FILE__) + "/scraper"

class RepositoryScraper < Scraper

	def initialize(url)
		@url = url
	end
	
	def element_number_match
		%r{<div\s+class\s*=\s*"title"\s*>Repositories \((\d+)\)</div\s*>}
	end

	def element_match
		%r{<div\s+class\s*=\s*"result"\s*>\s*<h2\s+class\s*=\s*"title"\s*>\s*<a\s+href\s*=\s*"/(.*)">}
	end

end
