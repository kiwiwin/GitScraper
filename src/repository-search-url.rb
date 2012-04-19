class RepositorySearchURL
	attr_accessor :size	
	attr_accessor :forks
	attr_accessor :fork
	attr_accessor :pushed
	attr_accessor :username
	attr_accessor :language
	attr_accessor :created
	attr_accessor :followres
	attr_accessor :actions

	def search_url
		criterias = ""

		self.instance_variables.sort.each do |criteria|
			if criterias.size > 0
				criterias += "+"
			end
			
			criterias += "#{criteria[1..-1]}%3A#{self.instance_variable_get(criteria)}"					
		end

		"https://github.com/search?&q=#{criterias}&type=Repositories"
	end

	def single_page_url(page_index)
		search_url + "&start_value=#{page_index}"
	end
end
