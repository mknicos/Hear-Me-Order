require 'spec_helper'

describe Restaurant do
  it {should validate_uniqueness_of :phone }

  describe 'name' do
    #allow spaces and apostrophes, but not other symbols
      it { should allow_value('McDonalds').for(:name)}
      it { should allow_value('Burger King').for(:name)}
      it { should allow_value("Burger King's").for(:name)}
      it { should_not allow_value('mat@#t').for(:name)}
      it { should_not allow_value('McDonalds1').for(:name)}
  end

  describe 'geocode addresses' do
    it "should save the latitude and longitude of a restaurant" do
      statue = Restaurant.create(name: "Liberty", phone: "1112223333", address:"Liberty Island, New York, NY 10004")
      statue.latitude.should == 40.689758
      statue.longitude.should == -74.045138
    end
  end
end
