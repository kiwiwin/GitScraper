require File.dirname(__FILE__) + '/repository-clone'
require 'rubygems'
require 'colorize'

repositories = File.open(File.dirname(__FILE__) + "/../data/java_repository.data").readlines

seed = File.open(File.dirname(__FILE__) + "/../data/seed.tmp", 'r')
seed_from = seed.read.to_i
seed.close

repos_clone = RepositoryClone.new
seed_range = 3
seed_from.upto(seed_from+seed_range) {
	|index|

	#if certain directory has already exist, remove the directory first
	dir_exist = `ls #{repositories[index].chomp} 2> /dev/null`
	if (dir_exist != "")
		'rm -rf #{repositories[index].chomp}'
	end

	STDOUT.write "clone #{repositories[index]}".yellow
	repos_clone.clone(repositories[index].chomp)

	seed = File.open(File.dirname(__FILE__) + "/../data/seed.tmp", 'w')
	seed.puts "#{index+1}"
	seed.close
}
