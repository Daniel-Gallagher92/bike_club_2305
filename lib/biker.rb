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

  #This method was a doozy. I could not figure out how to NOT overwrite my array.
  #I will be focusing on this with student support today, so any notes are greatly appreciated. 

  def log_ride(ride, time)
   # # return "cannot complete ride" if !distance < biker.max_distance && @terrain.include?(@acceptable_terrain)
      @rides[ride] = []
      @rides[ride] = [] << time
  end
  
end