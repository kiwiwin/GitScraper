Gem::Specification.new do |s|
	s.name = 'gitscraper'
	s.version = '0.0.1'
	s.summary = 'scrape github stuff'
	s.has_rdoc = false

	s.files = %w(
		README
		src/scraper.rb
		src/search_url.rb
	)
	
	s.require_path = 'src'
	s.authors = ["kiwi"]
	s.email = "kiwi.swhite.coder@gmail.com"
	s.homepage = "https://github.com/kiwiwin/GitScraper"
end
