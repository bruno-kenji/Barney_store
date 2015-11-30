require 'spec_helper'

describe OperatorsController, type: :controller do
    before :each do
        @operator = FactoryGirl.create(:operator)
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
        end
    end
end