class RepositorySearchScraper
	def initialize(content)
		@content = content
	end
	
	def repository_num
		@content.match(%r{<div\s+class\s*=\s*"title"\s*>Repositories \((\d+)\)</div\s*>})[1].to_i
	end

	def repositories
		repos_match = %r{<div\s+class\s*=\s*"result"\s*>\s*<h2\s+class\s*=\s*"title"\s*>\s*<a\s+href\s*=\s*"/(.*)">}

		@content.scan(repos_match).flatten
	end
end
