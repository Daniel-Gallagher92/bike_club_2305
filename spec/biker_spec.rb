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
  end
end