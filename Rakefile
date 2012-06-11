require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require File.join(File.dirname(__FILE__), 'lib', 'synthesis', 'version')

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the asset_packager plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the asset_packager plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'AssetPackager'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('Readme.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "asset_packager"
    gemspec.version = Synthesis::Version.dup
    gemspec.summary = "JavaScript and CSS Asset Compression for Production Rails Apps"
    gemspec.description = "This Rails plugin makes it simple to merge and compress JavaScript and CSS down into one or more files, increasing speed and saving bandwidth"
    gemspec.email = "brady@ldawn.com"
    gemspec.homepage = "http://synthesis.sbecker.net/pages/asset_packager"
    gemspec.authors = ["Scott Becker", "Brady Bouchard", "Igor Galeta"]
    gemspec.files = FileList["[A-Z]*", "lib/**/*"]
    gemspec.rubyforge_project = "asset_packager"
  end
  
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end
