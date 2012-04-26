class SearchFilter

	def criteria
		self.instance_variables.sort.inject("") {
			|criterias, criteria|

			if criterias.size > 0
				criterias += "+"
			end

			criterias + "#{criteria[1..-1]}%3A#{self.instance_variable_get(criteria)}"
		}
	end

	def type
	end
end
