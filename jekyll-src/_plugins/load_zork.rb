class NotionDatabase
  def initialize(notion)
    @notion = notion
    @guid_map = {}
  end
  def load_notion_collection(page_id)
    @page = @notion.get_page(page_id)
    #@guid_map[page_id] = @collection
    puts @page.collection_id
    #require 'httplog'
    rows = @page.rows
    puts " ROWS "+rows.inspect
    rows.each do |r|
      puts "ROW"+r
    end
  end
end

def doit(site)
  # code to call after Jekyll renders a page
  def visit(site,input)
    puts("VISIT(#{input})")
    found = site.data['zork'].find {|x| (x['name'] + ".md") == input }
    if !found
      puts(found)
    end
  end

  dir = site.config['zork_dir'] || 'zork'
  path = File.join(site.source,'..',dir)
  puts("Site is loaded, now augment the data")
  Dir.each_child(path) {|x| visit(site,x) }

  NotionLink.new_from_link("https://www.notion.so/Eric-Welton-81f2b22a7d02414fb581749742aebf43")

  require 'notion_api'
  token_v2 = site.data['sources']['notion']['auth']['token_v2']
  databases = site.data['sources']['notion']['databases']
  @notion = NotionAPI::Client.new(token_v2,"f6b1d417-bc52-4b47-aa91-4d98d26f2ab9")
  puts "Making DB"
  db = NotionDatabase.new(@notion)
  databases.each_key do |dbname|
    key = databases[dbname]
    puts "Load "+dbname+" from "+key
    db.load_notion_collection(key)
  end
end

Jekyll::Hooks.register :site, :post_read do |site|

  #require 'httplog' # require this *after* your HTTP gem of choice
  puts "Do Zork Processing"
end
