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

      # ride3 = Ride.new({name: "Town Lake", distance: 60, loop: true, terrain: :gravel})

      biker.learn_terrain!(:gravel)
      biker.learn_terrain!(:hills)

      biker.log_ride(ride1, 92.5)
      biker.log_ride(ride1, 91.1)
      biker.log_ride(ride2, 60.9)
      biker.log_ride(ride2, 61.6)
      # biker.log_ride(ride3, 120.6)
  
      # expect(biker.log_ride(ride3, 120.6)).to eq("cannot complete ride")

      expect(biker.rides).to eq({ride1 => [92.5, 91.1], ride2 => [60.9, 61.6]})
    end
    
    it "can report personal record for ride" do
      biker = Biker.new("Kenny", 30)

      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      biker.learn_terrain!(:gravel)
      biker.learn_terrain!(:hills)

      biker.log_ride(ride1, 92.5)
      biker.log_ride(ride1, 91.1)
      biker.log_ride(ride2, 60.9)
      biker.log_ride(ride2, 61.6)

      expect(biker.personal_record(ride1)).to eq(91.1)
      expect(biker.personal_record(ride2)).to eq(60.9)
    end
  end
end