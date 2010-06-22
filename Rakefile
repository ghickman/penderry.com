require 'rake'
require 'spec/rake/spectask'

task :deploy => ['services:flickr', :jekyll]

desc 'Generate Flickr include file'
task :flickr do
  ruby File.join(File.dirname(__FILE__), 'scripts', 'flickr.rb')
end

file '_site/index.html' => FileList['source/_includes/*.html'] do
  sh '/opt/rubyee/bin/jekyll'
end
task :jekyll => '_site/index.html'