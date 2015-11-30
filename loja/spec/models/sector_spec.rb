require 'spec_helper'

describe Sector, :type => :model do
  it 'can be instantiated' do
    expect( Sector.new ).to be_an_instance_of Sector
  end

  it 'has a valid factory' do
    expect( FactoryGirl.create(:sector) ).to be_persisted
  end
end