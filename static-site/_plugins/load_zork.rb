module Jekyll
  module ZorkLoader
  end
end

Jekyll::Hooks.register :site, :post_read do |site|
  # code to call after Jekyll renders a page
  def visit(site,input)
    puts("VISIT(#{input})")
    found = site.data['zork'].find {|x| (x['name'] + ".md") == input }
    puts(found)
  end

  dir = site.config['zork_dir'] || 'zork'
  path = File.join(site.source,'..',dir)
  puts("LOAD THE ZORKS from")
  Dir.each_child(path) {|x| visit(site,x) }

end
