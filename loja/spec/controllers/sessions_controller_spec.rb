require 'spec_helper.rb'

describe SessionsController, type: :controller do
    before :each do
        @operator = FactoryGirl.create(:operator)
    end

    describe "GET create" do
        context 'when passed params are valid' do
            it 'renders the admin_index_url without error' do
                session[:operator_id] = @operator.id
                expect(response.status).to eq 200
            end
        end
    end
    describe "DELETE destroy" do
        context 'when operator log out' do
            it 'redirects to store/index' do
                session[:operator_id] = @operator.id
                response = delete :destroy, id: @operator.id
                expect(response).to redirect_to '/store'
            end
        end
    end
end