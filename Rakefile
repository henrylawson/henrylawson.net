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

desc "Update the AWS infrastructure"
task :infra do
  execute("bin/terraform.sh apply")
end
task :i => :infra

desc "Deploy the website to PROD on S3"
task :deploy => [:build] do
  puts "#{Time.new}: Publishing website"

  execute("mkdir -p s3/_site_deploy")
  execute("find _site_deploy -name 'index.html' -type f -exec bash -c 'cp -f $1 \"s3/$(dirname $1)\"' -- {} \\\;")
  execute("find _site_deploy -not -name 'index.html' -type f -exec bash -c 'mkdir -p $(dirname \"s3\/$1\") && cp $1 \"s3/$1\"' -- {} \\\;")

  execute("rm -rf _site_deploy_s3")
  execute("mv s3/_site_deploy _site_deploy_s3")
  execute("rm -rf s3")

  execute("aws s3 sync _site_deploy_s3/ s3://henrylawson.net-production --exclude \"*.*\" --cache-control \"max-age = 1209600\" --content-type \"text/html\"")
  execute("aws s3 sync _site_deploy_s3/ s3://henrylawson.net-production --include \"*.*\" --cache-control \"max-age = 1209600\"")
end
task :dp => :deploy

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
