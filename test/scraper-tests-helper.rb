require File.dirname(__FILE__) + "/../src/user-scraper"
require File.dirname(__FILE__) + "/../src/repository-scraper"
require File.dirname(__FILE__) + "/../src/search-url"

class ScraperTestsHelper

	def self.create_scraper_of_stub_url(class_name, fixture_type)
		fixture_name = "#{fixture_type}_#{class_name.split("Scraper")[0].downcase}_page.html"
		stub_url = StubSearchURL.new("#{File.dirname(__FILE__)}/fixture/#{fixture_name}")
	
		scraper = eval(class_name).new(stub_url) 
	end

	def self.load_result_list(class_name, fixture_type)
		result_name = "#{fixture_type}_#{class_name.split("Scraper")[0].downcase}_list"
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
