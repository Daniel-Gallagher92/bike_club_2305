require './lib/ride'

class Biker 
attr_reader :name, :max_distance, :rides,
:acceptable_terrain
  def initialize(name, max_distance) 
    @name = name
    @max_distance = max_distance
    @rides = {}
    @acceptable_terrain = []
  end

  def learn_terrain!(new_terrain) 
    @acceptable_terrain << new_terrain
  end

  def log_ride(ride, time)
    if @acceptable_terrain.include?(ride.terrain) && @max_distance >= ride.total_distance
      if @rides[ride].nil?
        @rides[ride] = [] 
      end
      @rides[ride] << time
    end
  #  if ride.total_distance > self.max_distance || !@acceptable_terrain.include?(ride.terrain)
  #   return "cannot complete ride" 
  #  end
  end
  
  def personal_record(ride)
    return false if @rides[ride].nil?
    @rides[ride].min
  end
end