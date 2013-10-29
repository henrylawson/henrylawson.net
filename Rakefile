require 'yaml'
require './lib/execute.rb'

task :default => [:build]

CONFIG = YAML.load_file("build.yml")

desc "Cleans the destination folder"
task :clean do
	puts "Cleaning the #{CONFIG["destination"]} folder"
	execute("rm -rf #{CONFIG["destination"]}") 
end

desc "Builds the website"
task :build => [:clean] do
	puts "Building website to #{CONFIG["destination"]}"
	execute("jekyll build -s #{CONFIG["source"]} -d #{CONFIG["destination"]}")
end

desc "Runs a server"
task :start => [:clean] do
	puts "Launching website to http://localhost:4000/"
	execute("jekyll serve --detach -s #{CONFIG["source"]} -d #{CONFIG["destination"]}")
end

desc "Publishes the application to the server"
task :publish => [:build] do
	puts "Publishing website"
	execute("ssh #{CONFIG["host"]} 'rm -rf #{CONFIG["publish"]}/*'")
	execute("scp -r #{CONFIG["destination"]}/* #{CONFIG["host"]}:#{CONFIG["publish"]}")
end
