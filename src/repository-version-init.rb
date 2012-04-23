require 'colorize'
require File.dirname(__FILE__) + "/repository-version"

version = RepositoryVersion.new

repos_name = "jclouds/jclouds"
out = File.open("../jclouds_jclouds_result", "w")

diff = ""
new_version = 0

while true
	STDOUT.write "\rgit --git-dir=#{File.dirname(__FILE__)}/../data/#{repos_name}/.git diff ".yellow + "HEAD~#{new_version+1} HEAD~#{new_version}".blue
	diff = `git --git-dir=#{File.dirname(__FILE__)}/../data/#{repos_name}/.git diff HEAD~#{new_version+1} HEAD~#{new_version} --shortstat`
	if diff == ""
		break
	end
	#puts diff
	#out.puts version.add_file_number(diff).to_s + "  " + version.add_file_number(diff).to_s + " " + version.modify_file_number(diff).to_s
	out.puts version.insert_line_number(diff).to_s + " " + version.delete_file_number(diff).to_s
	new_version += 1
end
