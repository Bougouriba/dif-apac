require_relative 'lib/model/database.rb'


def run_hook(site)
  # code to call after Jekyll renders a page
  sources = SourcesFile.new(site)
  schedule = ScheduleDatabase.new(sources)
  if schedule.fully_integrated?
    puts "Yeah"
  else
    schedule.no_guids.each do |x|
      puts x.name
    end
  end
  #schedule.yaml.save()
end

Jekyll::Hooks.register :site, :post_read do |site|

  #require 'httplog' # require this *after* your HTTP gem of choice
  begin
    run_hook(site)
  rescue => exception
    puts exception.backtrace
    raise # always reraise
  end
end
