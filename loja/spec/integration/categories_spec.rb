require 'spec_helper'

describe 'As an operator', type: :request do
    describe 'I can manage the categories' do
        context 'Having some categories' do
            before :each do
                FactoryGirl.create_list(:category, 3)
                operator = FactoryGirl.create(:operator)
                session[:operator_id] = operator.id
                visit categories_path
            end

            specify 'I can delete an category' do
                category = Category.first
                save_and_open_page
                find(".cpy-delete-category-#{category.id}").click
                expect(page).not_to have_content(category.title)
                expect( Category.exists? category.id ).to eq(false)
            end
        end
    end
end