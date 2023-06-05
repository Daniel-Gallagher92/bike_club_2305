require 'rspec'
require './lib/ride'
require './lib/biker'

RSpec.describe Biker do 
   describe "#initialize" do 
    it "can initialize with attributes" do
      biker = Biker.new("Kenny", 30)

      expect(biker).to be_a(Biker)
      expect(biker.name).to eq("Kenny")
      expect(biker.max_distance).to eq(30)
      expect(biker.rides).to eq({})
      expect(biker.acceptable_terrain).to eq([])
    end

    it "can learn new terrain" do 
      biker = Biker.new("Kenny", 30)
      biker.learn_terrain!(:gravel)
      biker.learn_terrain!(:hills)

      expect(biker.acceptable_terrain).to eq([:gravel, :hills])
    end

    it "can log ride info" do 
      biker = Biker.new("Kenny", 30)
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
      biker.log_ride(ride1, 92.5)
      biker.log_ride(ride1, 91.1)
      # biker.log_ride(ride2, 60.9)
      # biker.log_ride(ride2, 61.6)

      expect(biker.rides).to eq({ride1 => [92.5, 91.1]})
      
    end

  end
end