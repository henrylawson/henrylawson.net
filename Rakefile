require 'yaml'
require './lib/execute.rb'

task :default => [:build]

CONFIG = YAML.load_file("build.yml")

desc "Cleans the build folder"
task :clean do
	puts "Cleaning the #{CONFIG["target"]} folder"
	execute("rm -rf #{CONFIG["target"]}") 
end

desc "Builds the website"
task :build => [:clean] do
	puts "Building website to #{CONFIG["target"]}"
	execute("bundle exec jekyll build -s #{CONFIG["source"]} -d #{CONFIG["target"]}")
end

desc "Runs a local server"
task :start => [:clean] do
	puts "Launching website to http://localhost:4000/"
	execute("bundle exec jekyll serve -s #{CONFIG["source"]} -d #{CONFIG["target"]}")
end

desc "Publishes the website"
task :publish => [:build] do
	puts "Publishing website"
	execute("ssh #{CONFIG["host"]} 'rm -rf #{CONFIG["publish_temp"]}/* && mkdir -p #{CONFIG["publish_temp"]}'")
	execute("scp -r #{CONFIG["target"]}/* #{CONFIG["host"]}:#{CONFIG["publish_temp"]}")
	execute("ssh #{CONFIG["host"]} 'rm -rf #{CONFIG["publish"]}/*' && mv -f #{CONFIG["publish_temp"]}/* #{CONFIG["publish"]}")
end
