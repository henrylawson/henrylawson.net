module Jekyll
  class AmpPost < Page
    def initialize(site, base, dir, post)
      @site = site
      @base = base
      @dir = dir
      @name = "#{post.id}.html"
      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'post_amp.html')
      self.content               = post.content
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
        ampPost = AmpPost.new(site, site.source, dir, post)
        ampPost.render(site.layouts, site.site_payload)
        ampPost.write(site.dest)
        site.pages << ampPost
      end
    end
  end
end
