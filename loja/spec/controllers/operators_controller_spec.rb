require 'spec_helper'

describe OperatorsController, type: :controller do
    describe "GET index" do
        it "renders the :index view"
    end

    describe "DELETE destroy" do
        before :each do
            @operator = Factory.build(:operator)
        end

        it "deletes the operator" do
            expect {
                delete :destroy, id: @operator
            }.to change(Operator,:count).by(-1)
        end
    end
end 