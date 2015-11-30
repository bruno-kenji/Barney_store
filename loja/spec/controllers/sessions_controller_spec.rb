require 'spec_helper.rb'
describe "GET #create" do
    context 'when password is invalid' do
        it 'renders the page with error' do
            operator = FactoryGirl.create(:operator)

            post :create, session: { email: operator.email, password: 'oi' }

            expect(response).to redirect_to admin_index_url
        end
    end
end


