class Ride 
  attr_reader :name, :distance, :terrain,
  :loop
  def initialize(ride_info)
    @name = ride_info[:name]
    @distance = ride_info[:distance]
    @loop = ride_info[:loop]
    @terrain = ride_info[:terrain]
  end

  def loop?
    @loop
  end

  def total_distance
    if @loop == true
      @distance
    else
      @distance * 2
    end
  end
end