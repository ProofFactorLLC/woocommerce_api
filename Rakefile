# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "woocommerce_api_v2"
  gem.homepage = "http://github.com/tradegecko/woocommerce_api_v2"
  gem.license = "MIT"
  gem.summary = %Q{Enables Ruby applications to communicate with the WooCommerce API}
  gem.description = %Q{Enables Ruby applications to communicate with the WooCommerce API.}
  gem.email = "support@tradegecko.com"
  gem.authors = ["TradeGecko"]
  # dependencies defined in Gemfile
  gem.files = Dir.glob('lib/**/*.rb')
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "woocommerce_api_v2 #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc "Open an irb session with WoocommerceAPI"
task :console do
  require 'irb'
  require 'irb/completion'
  require 'woocommerce-api'
  ARGV.clear
  IRB.start
end
