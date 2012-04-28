require File.dirname(__FILE__) + "/../src/user-search-filter"
require File.dirname(__FILE__) + "/../src/repository-search-filter"

describe SearchFilter do
	def check_attribute(class_instance, attribute_name_list)
		methods = class_instance.methods

		attribute_name_list.inject(true) {
			|prev_attribute_status, attribute|

			prev_attribute_status \
			&& methods.include?("#{attribute}")\
			&& methods.include?("#{attribute}=")
		}		
	end

	describe :criteria do
		it "criteria for user whose location is china" do
			#when
			filter = UserSearchFilter.new
			filter.location = "china"

			#then
			filter.criteria.should == "location%3Achina"
		end

		it "criteria for repository whose " do
			#when
			filter = RepositorySearchFilter.new
			filter.language = "Csharp"
			filter.size = "10"

			#then
			filter.criteria.should == "language%3ACsharp+size%3A10"
		end
	end

	describe UserSearchFilter do
		before(:all) do 
			@user_filter = UserSearchFilter.new
		end

		it "has crtieria : location" do
			check_attribute(@user_filter, ["location"]).should == true
		end

		it "type is Users" do
			@user_filter.type.should == "Users"
		end	
	end

	describe RepositorySearchFilter do
		before(:all) do 
			@repository_filter = RepositorySearchFilter.new
		end

		it "has criterias " do
			expect_criterias = ["language", "size", "forks", 
									  "fork", "pushed", "username",
									  "created", "followres", "actions"]
			check_attribute(@repository_filter, expect_criterias)
		end

		it "type is Repositories" do
			@repository_filter.type.should == "Repositories"
		end	
	end
end
