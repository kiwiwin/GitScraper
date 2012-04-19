require './repository-search-url'
require './repository-scraper'
require 'colorize'

search_url = RepositorySearchURL.new
search_url.language = "java"
#search_url.size = 10000
repository_file = File.open("java_repository.tmp", 'w')

scraper = RepositoryScraper.new(search_url)

page_number = scraper.page_number;

start_time = Time.now
puts "java repository scraper start from #{start_time}".yellow
1.upto(page_number) {
	|page_index|
	scraper.single_page_repositories(page_index).each do |repository|
		repository_file.write(repository + "\n")
		repository_file.flush
	end
	STDOUT.write "\rprocess: #{page_index.to_s.blue}/#{page_number.to_s.blue}, percentage: #{(100*page_index/page_number).to_s.blue}%"; 
}
end_time = Time.now
puts ""
puts "java repository scraper end at #{end_time}".yellow
puts "\n"*2
puts "###########SUMMARY###############"
puts "Scrape repository pages: #{page_number}".yellow
puts "Cost time: #{ Time.at(end_time - start_time).gmtime.strftime('%R:%S')}".yellow
