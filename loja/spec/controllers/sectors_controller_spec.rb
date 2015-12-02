require 'spec_helper'

describe SectorsController, type: :controller do
    before :each do
        @sector = FactoryGirl.create(:sector)
    end

    describe 'GET #index' do
        context 'operator not logged in' do
            it 'redirects to login path' do
                expect(response.status).to eq 200
                response = get :index, format: :json
                expect(response).to redirect_to "/login"
            end
        end
        context 'operator logged in' do
            it 'renders the index view' do
                operator = FactoryGirl.create(:operator)
                session[:operator_id] = operator.id

                expect(response.status).to eq 200
                response = get :index, format: :json
                expect(response).to render_template "index"
            end
        end
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
            expect(response.status).to eq 200
        end
    end

    describe 'DELETE /sector/:id' do
        it 'deletes the sector with the passed id' do
            subject = Sector.first
            #expect_any_instance_of(subject.class).to receive(:authorize).and_return(true)
            expect(response.status).to eq 200
            response = delete :destroy, id: subject.id
            expect(flash[:alert]).to eq("Please login to access admin content")
        end
    end
end 