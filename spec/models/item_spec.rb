require 'spec_helper'

describe Item do

  describe 'name' do
    #allow spaces but not other symbols
      it { should allow_value('Cheeseburger').for(:name)}
      it { should allow_value('Bacon Cheeseburger').for(:name)}
      it { should_not allow_value('Chee@#burger').for(:name)}
      it { should_not allow_value('Cheeseburger1').for(:name)}
  end

  describe 'price' do
    it {should allow_value(22.30).for(:price)}
    it {should allow_value(10).for(:price)}
    it {should_not allow_value(-10.00).for(:price)}
    it {should_not allow_value(0).for(:price)}
    it {should_not allow_value("expensive").for(:price)}
  end
end
