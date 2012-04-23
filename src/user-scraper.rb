class UserScraper
	def initialize(url)
		@url = url
	end

	def user_number
		content = open(@url.search_url).read
		content.match(%r{<div\s+class\s*=\s*"title"\s*>Users \((\d+)\)</div\s*>})[1].to_i
	end
end
