require 'spec_helper'

describe 'having some products' do
    before :each do
        FactoryGirl.create_list(:product, 3)
        visit products_path
    end

