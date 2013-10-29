require 'yaml'
require './lib/execute.rb'

task :default => [:build]

CONFIG = YAML.load_file("build.yml")

desc "Cleans the build folder"
task :clean do
	puts "Cleaning the #{CONFIG["destination"]} folder"
	execute("rm -rf #{CONFIG["destination"]}") 
end

desc "Builds the website"
task :build => [:clean] do
	puts "Building website to #{CONFIG["destination"]}"
	execute("jekyll build -s #{CONFIG["source"]} -d #{CONFIG["destination"]}")
end

desc "Runs a local server"
task :start => [:clean] do
	puts "Launching website to http://localhost:4000/"
	execute("jekyll serve --detach -s #{CONFIG["source"]} -d #{CONFIG["destination"]}")
end

desc "Publishes the website"
task :publish => [:build] do
	puts "Publishing website"
	execute("ssh #{CONFIG["host"]} 'rm -rf #{CONFIG["publish"]}/*'")
	execute("scp -r #{CONFIG["destination"]}/* #{CONFIG["host"]}:#{CONFIG["publish"]}")
end
