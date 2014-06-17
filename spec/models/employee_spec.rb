require 'spec_helper'

describe Employee do
  it {should validate_uniqueness_of :email }

  describe 'name' do
    context 'first_name' do
      it { should allow_value('matt').for(:first_name)}
      it { should_not allow_value('matt1').for(:first_name)}
      it { should_not allow_value('matt example').for(:first_name)}
      it { should_not allow_value('mat@#t').for(:first_name)}
    end
    context 'last_name' do
      it { should allow_value('example').for(:last_name)}
      it { should_not allow_value('example1').for(:last_name)}
      it { should_not allow_value('matt example').for(:last_name)}
      it { should_not allow_value('mat#').for(:last_name)}
    end
  end
end
