require_relative 'example_helper'

#limit to search users, location is chengdu, first language is java
search_url =  SearchURL.new(:users, :location => "chengdu", :language => "java")
puts Scraper.new(search_url).all_elements
