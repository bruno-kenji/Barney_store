require 'spec_helper'

describe Category, :type => :model do
  it 'can be instantiated' do
    expect( Category.new ).to be_an_instance_of Category
  end

  it 'has a valid factory' do
    expect( FactoryGirl.create(:category) ).to be_persisted
  end
end