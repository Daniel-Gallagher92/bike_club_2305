class BikeClub
  attr_reader :name, :bikers

  def initialize(name)
    @name = name
    @bikers = []
  end

  def add_bikers(biker_array)
    @bikers.push(*biker_array)
  end

  def most_rides
    @bikers.max_by do |biker|
      require 'pry'; binding.pry
      # biker.rides.values.flatten.count
    end
  end
end