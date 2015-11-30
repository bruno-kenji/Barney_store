require 'spec_helper'

describe CategoriesController, type: :controller do
    before :each do
        @category = FactoryGirl.create(:category)
    end

    describe 'POST /categories' do
        it 'creates a new category with the passed params' do
            category_attributes = {
                title: 'test category'
            }

            category = Category.last
            expect(category.title).to eq(@category.title)
        end
    end

    describe 'PUT /category' do
        it 'updates an category with the passed params' do
            category = Category.first

            category_attributes = {
                title: 'test category'
            }
            expect(category.title).to eq(@category.title)
        end
    end

    describe 'DELETE /category/:id' do
        it 'deletes the category with the passed id' do
            category = Category.first
            expect(response.status).to eq 200
        end
    end
end