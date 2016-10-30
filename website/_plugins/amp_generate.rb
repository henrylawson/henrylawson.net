module Jekyll
  class AmpPost < Page
    def initialize(site, base, dir, post)
      @site = site
      @base = base
      @dir = dir
      @name = "#{post.id}.html"
      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'amp.html')
      self.data['body']          = post.content
      self.data['title']         = post.data['title']
      self.data['date']          = post.data['date']
      self.data['author']        = post.data['author']
      self.data['category']      = post.data['category']
      self.data['canonical_url'] = post.url
    end
  end

  class AmpGenerator < Generator
    priority :low
    def generate(site)
      dir = site.config['ampdir'] || 'amp'
      site.posts.docs.each do |post|
        index = AmpPost.new(site, site.source, dir, post)
        index.render(site.layouts, site.site_payload)
        index.write(site.dest)
        site.pages << index
      end
    end
  end
end
