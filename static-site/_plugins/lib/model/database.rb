require_relative '../data/database.rb'

class ScheduleDatabase < Database
  def initialize(sources)
    super(sources,'schedule',ScheduleEntry)
  end

end
