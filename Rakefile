require 'rubygems'
require 'spec/rake/spectask'

task :default => [:spec]

Spec::Rake::SpecTask.new(:spec) do |t|
	t.spec_files = Dir.glob('spec/**/*-spec.rb')
	t.spec_opts << '--format specdoc'
  	t.rcov = true
end
