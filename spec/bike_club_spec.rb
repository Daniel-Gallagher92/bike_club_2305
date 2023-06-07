require './lib/bike_club'
require './lib/ride'
require './lib/biker'

RSpec.describe BikeClub do
  before(:each) do 
    @bike_club = BikeClub.new("Turing's Tourings")

    @good_biker = Biker.new("Kenny", 30)
    @fast_biker = Biker.new("Zippy", 150)
    @consistent_biker = Biker.new("Maggie", 160)

    @good_biker.learn_terrain!(:hills)
    @good_biker.learn_terrain!(:gravel)
    @fast_biker.learn_terrain!(:hills)
    @fast_biker.learn_terrain!(:gravel)
    @consistent_biker.learn_terrain!(:gravel)

    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    @ride3 = Ride.new({name: "Another Loop", distance: 100, loop: true, terrain: :gravel})
  end

  it "exists and has a name" do 
    expect(@bike_club).to be_a(BikeClub)
    expect(@bike_club.name).to eq("Turing's Tourings")
  end

  it "starts with no bikers, but bikers can be added" do 
    expect(@bike_club.bikers).to be_empty
    @bike_club.add_bikers([@good_biker, @consistent_biker, @fast_biker])
    expect(@bike_club.bikers).to eq([@good_biker, @consistent_biker, @fast_biker])
  end
  
    it "can tell who has logged most rides" do 
      biker1 = Biker.new("Kenny", 30)
      biker2 = Biker.new("Athena", 15)

      @bike_club.add_bikers([@biker1, biker2])

      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
      ride3 = Ride.new({name: "Another Loop", distance: 100, loop: true, terrain: :flat})

      biker1.learn_terrain!(:gravel)
      biker1.learn_terrain!(:hills)
      biker2.learn_terrain!(:flat)
      biker2.learn_terrain!(:hills)

      biker1.log_ride(ride1, 92.5)
      biker1.log_ride(ride1, 91.1)
      
      biker1.log_ride(ride2, 61.6)
      
      biker1.log_ride(ride3, 60.9)

      biker2.log_ride(ride1, 84.3)
      biker2.log_ride(ride1, 91.7)
      
      biker2.log_ride(ride2, 61.6)

      biker2.log_ride(ride3, 73.8)
      biker2.log_ride(ride3, 56.3)

      expect(@bike_club.most_rides).to eq(biker2)
    end

  # it "can tell us which biker has logged most rides" do
  #   @bike_club.add_bikers([@fast_biker, @good_biker, @consistent_biker])
  #   @good_biker.log_ride(@ride_1, 70) #raising error here
  #   @good_biker.log_ride(@ride1, 65)
  #   @good_biker.log_ride(@ride2, 60)
  #   @fast_biker.log_ride(@ride_2, 50)
  #   @fast_biker.log_ride(@ride_3, 80)


  #   expect(@bike_club.most_rides).to eq(@good_biker)
  # end
end