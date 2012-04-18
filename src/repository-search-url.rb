class RepositorySearchURL
	attr_accessor :size	
	attr_accessor :language

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
end
