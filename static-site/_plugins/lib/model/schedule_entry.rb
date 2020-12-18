class ScheduleEntry
  def initialize(yaml)
    @hashes = [ yaml ]

    @guid = yaml['Guid']
    @name = yaml['Name']
    @business = yaml['Business']
    @country = yaml['Country Spotlight']
    @agenda = yaml['Notion Link']
    @events = yaml['Events']
    @legal = yaml['Legal']
    @who = yaml['Responsibility']
    @social = yaml['Social']
    @when = yaml['When']

    self.map_back()
    @fields = {
      "Guid" => 'guid',
      'Name' => 'name',
      'Notion Link' => 'agenda',
      'Business' => 'business',
      'Country Spotlight' => 'country',
      'Events' => 'events',
      'Legal' => 'legal',
      'Responsibility':"responsibility",
      'Social' => 'social',
      'When' => 'when'
    }
  end

  attr_reader :guid, :name, :business, :country, :events, :legal, :who, :social, :when, :hashes

  def [](key)
    result = @hashes[0][key]
    #puts "LOOK UP "+key.inspect+" => "+result.inspect
    result
  end
  def []=(key,value)
    @hashes.each do |hash|
      hash[key]=value
    end
    self.map_into(@hashes[0])
  end

  def map_into(hash)
    @guid = hash['Guid']
    @name = hash['Name']
    @business = hash['Business']
    @country = hash['Country Spotlight']
    @agenda = hash['Notion Link']
    @events = hash['Events']
    @legal = hash['Legal']
    @who = hash['Responsibility']
    @social = hash['Social']
    @when = hash['When']
  end

  def map_back()
    @hashes.each do |hash|
      hash['Guid'] = @guid
      hash['Name'] = @name
      hash['Notion Link'] = @agenda
      hash['Business'] = @business
      hash['Country Spotlight'] = @country
      hash['Events'] = @events
      hash['Legal'] = @legal
      hash['Responsibility'] = @who
      hash['Social'] = @social
      hash['When'] = @when
    end
  end

  def merge(another)
    puts "I HAVE BEEN ASKED TO MERGE"
    #puts another.hashes[0].inspect
    #puts self.hashes[0].inspect
    #puts another.hashes[0]["Guid"].inspect
    #puts self.hashes[0]["Guid"].inspect
    @fields.each_key do |field|
      #puts field.inspect
      #puts "Guid".inspect
      a = self.hashes[0][field]
      b = another.hashes[0][field]
      puts "MERGING FIELD "+field.inspect+":"+a.inspect+":"+b.inspect
      if a != b
        if b
          puts "SETTING FIELD "+field+" to "+b.inspect
          self[field] = b
        end
        if a
          puts "SETTING FIELD "+field+" to "+a.inspect
          another[field] = a
        end
      end
    end
    self.hashes << another.hashes
    self.map_into(self.hashes[0])
    #raise "damn it"
  end
  def matches?(another)
    @name == another.name
  end


  def topic_markdown()
    "Topic Markdown"
    raise
  end

end
