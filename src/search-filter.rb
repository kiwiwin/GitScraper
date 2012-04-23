class SearchFilter

	def criteria
		criterias = ""

		self.instance_variables.sort.each do |criteria|
			if criterias.size > 0
				criterias += "+"
			end
			
			criterias += "#{criteria[1..-1]}%3A#{self.instance_variable_get(criteria)}"					
		end
		criterias
	end

	def type
	end
end
