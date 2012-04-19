require 'open-uri'

class RepositoryScraper 

	def initialize(url)
		@url = url
	end
	
	def repository_number
		content = open(@url.search_url).read
		content.match(%r{<div\s+class\s*=\s*"title"\s*>Repositories \((\d+)\)</div\s*>})[1].to_i
	end

	def single_page_repositories(page_index)
		content = open(@url.single_page_url(page_index)).read
		repos_match = %r{<div\s+class\s*=\s*"result"\s*>\s*<h2\s+class\s*=\s*"title"\s*>\s*<a\s+href\s*=\s*"/(.*)">}
		
		content.scan(repos_match).flatten
	end

	def all_repositories
		result = []

		page_index = 1;
		while page_index <= page_number
			result += single_page_repositories(page_index)
			page_index += 1
		end

		result
	end

	def page_number
		(1.0 * repository_number / page_size).ceil
	end

	def page_size
		30
	end
end
