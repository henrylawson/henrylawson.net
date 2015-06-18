require 'yaml'
require './lib/execute.rb'

task :default => [:build]

CONFIG = YAML.load_file("build.yml")

desc "Cleans the target folder"
task :clean do
	puts "Cleaning the #{CONFIG["target"]} folder"
	execute("rm -rf #{CONFIG["target"]}")
end
task :c => :clean

desc "Cleans the deploy target folder"
task :clean_deploy do
	puts "Cleaning the #{CONFIG["deploy_target"]} folder"
	execute("rm -rf #{CONFIG["deploy_target"]}")
end
task :cd => :clean_deploy

desc "Builds the website"
task :build => [:clean_deploy] do
	puts "Building website to #{CONFIG["deploy_target"]}"
	execute("bundle exec jekyll build " +
          "-s #{CONFIG["source"]} -d #{CONFIG["deploy_target"]} " +
          "--verbose")
  execute("java -jar bin/htmlcompressor-1.5.3.jar " +
          "--recursive " +
          "--compress-css " +
          "--compress-js " +
          "--output #{CONFIG["deploy_target"]} #{CONFIG["deploy_target"]}")
end
task :b => :build

desc "Runs a local server"
task :serve, [:host, :port, :posts] => [:clean] do |t, args|
	args.with_defaults(:host => "localhost", :port => 4000, :posts => 5)
	puts "Launching website to http://#{args.host}:#{args.port}/"
	execute("bundle exec jekyll serve " +
          "--host #{args.host} " +
          "--port #{args.port} " +
          "--drafts " +
          "--limit_posts #{args.posts} " +
          "--watch " +
          "-s #{CONFIG["source"]} -d #{CONFIG["target"]}")
end
task :s => :serve

desc "Publishes the website"
task :publish => [:build] do
	puts "Publishing website"
	puts "Removing and creating temp location"
	execute("ssh #{CONFIG["host"]} -v '" +
          "rm -rf #{CONFIG["publish_temp"]}/* && " +
          "mkdir -p #{CONFIG["publish_temp"]}'")

  puts "Creating tar gz of target site"
  execute("tar -zcvf " +
          "#{CONFIG["deploy_target_compress"]} " +
          "-C #{CONFIG["deploy_target"]} .")

	puts "Uploading target to temp location"
	execute("scp -r " +
          "#{CONFIG["deploy_target_compress"]} " +
          "#{CONFIG["host"]}:#{CONFIG["upload_temp"]}")

	puts "Extracting target on server to temp location"
	execute("ssh #{CONFIG["host"]} -v " +
          "'tar -zxvf " +
          "#{CONFIG["upload_temp"]}/#{CONFIG["deploy_target_compress"]} " +
          "-C #{CONFIG["publish_temp"]}'")

  puts "Moving target to production"
	execute("ssh #{CONFIG["host"]} -v " +
          "'sudo su #{CONFIG["wwwuser"]} bash -c \"" +
          "rm -rf #{CONFIG["publish"]}/* && " +
          "cp -rf #{CONFIG["publish_temp"]}/* #{CONFIG["publish"]}\"'")
end
task :p => :publish
