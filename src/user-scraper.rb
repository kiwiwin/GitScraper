require File.dirname(__FILE__) + "/scraper"

class UserScraper < Scraper
	def initialize(url)
		super(url)
	end

	def element_number_match
		%r{<div\s+class\s*=\s*"title"\s*>Users \((\d+)\)</div\s*>}
	end

	def element_match
		%r{<h2\s+class\s*=\s*"title"\s*>\s*<a\s+href\s*=\s*"https://github.com/.*"\s*>\s*(.*)\s*</a\s*>}
	end
end
