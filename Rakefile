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
task :serve, [:host, :port] => [:clean] do |t, args|
	args.with_defaults(:host => "localhost", :port => 4000)
	puts "Launching website to http://#{args.host}:#{args.port}/"
	execute("bundle exec jekyll serve --host #{args.host} --port #{args.port} --drafts -s #{CONFIG["source"]} -d #{CONFIG["target"]}")
end

desc "Publishes the website"
task :publish => [:build] do
	puts "Publishing website"
	puts "Removing and creating temp location"
	execute("ssh #{CONFIG["host"]} 'rm -rf #{CONFIG["publish_temp"]}/* && mkdir -p #{CONFIG["publish_temp"]}'")
	puts "Uploading target to temp location"
	execute("scp -r #{CONFIG["target"]}/* #{CONFIG["host"]}:#{CONFIG["publish_temp"]}")
	puts "Moving target to production"
	execute("ssh #{CONFIG["host"]} 'rm -rf #{CONFIG["publish"]}/* && cp -rf #{CONFIG["publish_temp"]}/* #{CONFIG["publish"]}'")
end
