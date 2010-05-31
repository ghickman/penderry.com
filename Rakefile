require 'rake'
require 'spec/rake/spectask'

task :deploy => ['services:twitter', 'services:flickr', :jekyll]

namespace :services do
  desc 'Generate Flickr include file'
  task :flickr do
    ruby File.join(File.dirname(__FILE__), 'scripts', 'flickr.rb')
  end
end

file '_site/index.html' => FileList['source/_includes/*.html'] do
  sh '/usr/lib/ruby/1.8/bin/jekyll'
end
task :jekyll => '_site/index.html'