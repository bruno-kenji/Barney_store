require 'spec_helper'

describe OperatorsController, type: :controller do
    before :each do
        @operator = FactoryGirl.create(:operator)
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
    
    describe 'POST /operators' do
        it 'creates a new operator with the passed params' do
            operator_attributes = {
                name: 'test operator',
                email: 'test@operator.valid',
                password: 123321,
                password_confirmation: 123321,
                sector_id: 3
            }
            operator = Operator.last
            expect(operator.name).to eq(@operator.name)
            expect(operator.email).to eq(@operator.email)
            expect(operator.sector).to eq(@operator.sector)
        end
    end

    describe 'PUT /operator' do
        it 'updates an operator with the passed params' do
            operator = Operator.first

            operator_attributes = {
                name: 'test operator',
                email: 'test@operator.valid',
                password: 123321,
                password_confirmation: 123321,
                sector_id: 3
            }
            expect(operator.name).to eq(@operator.name)
            expect(operator.email).to eq(@operator.email)
            expect(operator.sector).to eq(@operator.sector)
        end
    end

    describe 'DELETE /operator/:id' do
        it 'deletes the operator with the passed id' do
            operator = Operator.first
            
            expect(response.status).to eq 200
            expect(flash[:alert]).to eq("Please login to access admin content")
        end
    end
end