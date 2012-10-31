require_relative 'example_helper'

search_url = SearchURL.new(:repositories, :language => "java")
puts Scraper.new(search_url).element_number
