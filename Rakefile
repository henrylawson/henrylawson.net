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
          "--watch " +
          "-s #{CONFIG["source"]} -d #{CONFIG["target"]}")
end
task :s, [:host, :port] => :serve

desc "Update the AWS infrastructure"
task :infra do
  execute("bin/terraform.sh apply")
end
task :i => :infra

desc "Build for S3"
task :build_s3 => [:build] do
  execute("rm -rf _site_deploy_s3")
  execute("cp -rf _site_deploy _site_deploy_s3")
  execute("find _site_deploy_s3 -name '*.html' -type f | while read NAME; do mv \"${NAME}\" \"${NAME%.html}\"; done")
end
task :b3 => :build_s3

desc "Deploy the website to PROD on S3"
task :deploy => [:build_s3] do
  max_age_assets   = 2628000 # 1 month
  max_age_articles = 604800  # 1 week
  max_age_indexes  = 86400   # 1 day

  index_pages_xml  = "\"*.xml\""
  index_pages_html = "index all"
  index_pages      = [index_pages_xml, index_pages_html].join(" ")

  base_command   = "aws s3 sync _site_deploy_s3/ s3://henrylawson.net-production"

  execute("#{base_command} --include \"*.*\" --exclude #{index_pages} --cache-control \"max-age = #{max_age_assets}\"")
  execute("#{base_command} --exclude \"*.*\" --exclude #{index_pages} --cache-control \"max-age = #{max_age_articles}\" --content-type \"text/html\"")
  execute("#{base_command} --include #{index_pages_xml} --cache-control \"max-age = #{max_age_indexes}\"")
  execute("#{base_command} --include #{index_pages_html} --cache-control \"max-age = #{max_age_indexes}\" --content-type \"text/html\"")
end
task :dp => :deploy

desc "Invalidate CloudFront cache"
task :invalidate do
  execute("aws cloudfront create-invalidation --distribution-id \"$(cd infra && terraform output aws_cloudfront_distribution)\" --paths / /sitemap.xml /feed/atom.xml /all")
end
task :iv => :invalidate

desc "Invalidate ALL CloudFront cache"
task :invalidate_all do
  execute("aws cloudfront create-invalidation --distribution-id \"$(cd infra && terraform output aws_cloudfront_distribution)\" --paths \"/*\"")
end
task :iva => :invalidate_all

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
