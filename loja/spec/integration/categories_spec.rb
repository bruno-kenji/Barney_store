require 'spec_helper'

describe 'I can see the products within the given category' do
    before :each do
        FactoryGirl.create_list(:category, 3)
    end
    it 'lists the products' do
        visit '/categories'
        save_and_open_page
        find('.cpy-categories_expanded').first(:link).click
        @category.products.each do |product|
            expect(page).to have_content(product.title)
            expect(page).to have_content(product.price.to_s)
        end
    end
end


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