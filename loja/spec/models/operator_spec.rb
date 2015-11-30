require 'spec_helper'

describe Operator, :type => :model do
  it 'can be instantiated' do
    expect( Operator.new ).to be_an_instance_of Operator
  end

  it 'has a valid factory' do
    expect( FactoryGirl.create(:operator) ).to be_persisted
  end
end