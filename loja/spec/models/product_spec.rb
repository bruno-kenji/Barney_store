require 'spec_helper'

describe Product, :type => :model do
  it 'can be instantiated' do
    expect( Product.new ).to be_an_instance_of Product
  end

  it 'has a valid factory' do
    expect( FactoryGirl.create(:product) ).to be_persisted
  end
end