require 'rubygems'
require 'rake/testtask'

task :default => [:test]

Rake::TestTask.new(:test) do |t|
	t.test_files = FileList['test/*-tests.rb']
end
