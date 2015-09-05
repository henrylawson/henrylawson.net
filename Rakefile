require 'yaml'
require './lib/execute.rb'
require 'kramdown'
require './lib/plain_text.rb'

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

desc "Cleans the deploy target folder"
task :spelling do
  execute("find #{CONFIG['posts']} -name '*.markdown' " +
          "-exec aspell --dont-backup --home-dir=./ -d en_US -c '{}' \\;")
end
task :sp => :spelling

desc "Provides the reading statistics of the article, ./website/_posts/{article}.markdown"
task :writing_stats, [:article] do |t, args|
  article_path = File.join(CONFIG['posts'], args.article + '.markdown')
  puts "Calculating statistics of #{article_path}"

  article_file = File.open(article_path)
  contents = article_file.read.gsub(/---.*---\n/m, '')
  text = Kramdown::Document.new(contents)
    .to_plain_text
    .gsub(/\n/m, ' ')
    .gsub(/\.\s*/, ".\n")
    .gsub(/\n$/, '')

  execute("echo -e '#{text}' | readability")
end
task :ws, [:article] => :writing_stats

desc "Checks all the links against local instance"
task :link_check, [:host, :port] do |t, args|
  args.with_defaults(:host => CONFIG["default_host"], :port => CONFIG["default_port"])
  url = "http://#{args.host}:#{args.port}"
  execute("linkchecker " +
          "#{url} " +
          "--check-extern " +
          "-v " +
          "-t 10 " +
          "&> #{CONFIG['link_checker_log']}; " +
          "cat #{CONFIG['link_checker_log']} " +
          "| grep 'Error:' -B6; " +
          "tail -2 #{CONFIG['link_checker_log']}")
end
task :lc, [:host, :port] => :link_check

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
task :serve, [:host, :port] => [:clean] do |t, args|
  args.with_defaults(:host => CONFIG["default_host"], :port => CONFIG['default_port'])
  puts "Launching website to http://#{args.host}:#{args.port}/"
  execute("bundle exec jekyll serve " +
          "--host #{args.host} " +
          "--port #{args.port} " +
          "--drafts " +
          "--future " +
          "--verbose " +
          "--watch " +
          "-s #{CONFIG["source"]} -d #{CONFIG["target"]}")
end
task :s, [:host, :port] => :serve

desc "Publishes the website to PROD"
task :publish => [:build] do
  puts "#{Time.new}: Publishing website"
  puts "#{Time.new}: Removing and creating temp location"
  execute("ssh #{CONFIG["host"]} -v '" +
          "rm -rf #{CONFIG["publish_temp"]}/* && " +
          "mkdir -p #{CONFIG["publish_temp"]}'")

  puts "#{Time.new}: Creating tar gz of target site"
  execute("GZIP=-9 tar -zcvf " +
          "#{CONFIG["deploy_target_compress"]} " +
          "-C #{CONFIG["deploy_target"]} .")

  puts "#{Time.new}: Uploading target to temp location"
  execute("rsync -v " +
          "-e 'ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null' " +
          "--progress #{CONFIG["deploy_target_compress"]} " +
          "#{CONFIG["host"]}:#{CONFIG["upload_temp"]}")

  puts "#{Time.new}: Extracting target on server to temp location"
  execute("ssh #{CONFIG["host"]} -v " +
          "'tar -zxvf " +
          "#{CONFIG["upload_temp"]}/#{CONFIG["deploy_target_compress"]} " +
          "-C #{CONFIG["publish_temp"]}'")

  puts "#{Time.new}: Moving target to production"
  execute("ssh #{CONFIG["host"]} -v " +
          "'sudo su #{CONFIG["wwwuser"]} bash -c \"" +
          "rm -rf #{CONFIG["publish"]}/* && " +
          "cp -rf #{CONFIG["publish_temp"]}/* #{CONFIG["publish"]}\"'")
  puts "#{Time.new}: Deployment complete"
end
task :p => :publish

desc 'Create a new draft post'
task :draft, [:date, :title] do |_t, args|
  args.with_defaults(
    :date => Date.today.to_s,
    :title => 'New Post')

  slug = "#{args.date}-#{args.title.downcase.gsub(/[^\w]+/, '-')}"
  file = File.join(
      '.',
      'website',
      '_drafts',
      "#{slug}.markdown")

  File.open(file, "w") do |f|
      f << <<-EOS.gsub(/^      /, '')
      ---
      layout: post
      title: #{args.title}
      date: #{args.date}
      ---

      Text above here will become the excerpt.

      <!--more-->

      The article will continue here.
      EOS
  end

  puts "Created draft article (for date #{args.date}):"
  puts file
end
task :d, [:date, :title] => :draft
