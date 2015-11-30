require 'spec_helper.rb'

describe SessionsController, type: :controller do
    describe "GET create" do
        context 'when passed params are valid' do
            it 'renders the admin_index_url without error' do
                subject = FactoryGirl.create(:operator)

                expect(response.status).to eq 200
            end
        end
    end
end