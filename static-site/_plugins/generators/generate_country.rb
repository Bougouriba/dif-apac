module Jekyll
  class ZorkPageGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'zork_index'
        dir = site.config['zork_dir'] || 'zork'
        site.data['zork'].each do |zork|
          name = Jekyll::Utils.slugify(zork['name'])
          site.pages << ZorkPage.new(site, site.source, File.join(dir, name), zork)
        end
      end
    end
  end

  # A Page subclass used in the `ZorkPageGenerator`
  class ZorkPage < Page
    def initialize(site, base, dir, zork)
      @site = site
      @base = base
      @dir  = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'zork_index.html')
      self.data['zork'] = zork

      zork_title_prefix = site.config['zork_title_prefix'] || 'Zork: '
      self.data['title'] = "#{zork_title_prefix}#{zork['name']}"
    end
  end
end
