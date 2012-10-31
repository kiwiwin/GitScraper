Dir[File.dirname(__FILE__) + "/../src/*.rb"].each do |source_file|
	require source_file
end

class ScraperTestsHelper

	def self.create_scraper_of_stub_url(type, fixture)
		fixture_name = "#{fixture}_#{type}_page.html"
		stub_url = StubSearchURL.new("#{File.dirname(__FILE__)}/fixture/#{fixture_name}")
	
		scraper = Scraper.new(stub_url) 
	end

	def self.load_result_list(type, fixture)
		result_name = "#{fixture}_#{type}_list"
		File.open("#{File.dirname(__FILE__)}/fixture/#{result_name}").readlines.collect {
 			|line|
			line.chomp
		}
	end

end

class StubSearchURL < SearchURL
	def initialize(filename)
		@filename = filename
	end

	def search_url
		@filename
	end

	def single_page_url(page_index)
		@filename
	end
end
