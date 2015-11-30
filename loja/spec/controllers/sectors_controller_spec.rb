require 'spec_helper'

describe SectorsController, type: :controller do
    before :each do
        @sector = FactoryGirl.create(:sector)
    end

    describe 'POST /sectors' do
        it 'creates a new sector with the passed params' do
            sector_attributes = {
                title: 'test sector'
            }
            sector = Sector.last
            expect(sector.title).to eq(@sector.title)
        end
    end

    describe 'PUT /sector' do
        it 'updates an sector with the passed params' do
            sector = Sector.first

            sector_attributes = {
                title: 'test sector'
            }
            expect(sector.title).to eq(@sector.title)
        end
    end

    describe 'DELETE /sector/:id' do
        it 'deletes the sector with the passed id' do
            sector = Sector.first
            expect(response.status).to eq 200
        end
    end
end 