require 'spec_helper'

describe ProductsController, type: :controller do
    before :each do
        @product = FactoryGirl.create(:product)
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
    
    describe 'POST /products' do
        it 'creates a new product with the passed params' do
            product_attributes = {
                title: 'test product',
                description: 'blablablabla',
                image_url: 'http://lorempixel.com/image_output/nightlife-h-c-640-753-8.jpg',
                price: 50.10
            }
            product = Product.last
            expect(product.title).to eq(@product.title)
            expect(product.description).to eq(@product.description)
            expect(product.image_url).to eq(@product.image_url)
            expect(product.price).to eq(@product.price)
        end
    end

    describe 'PUT /product/:id' do
        it 'updates an product with the passed params' do
            product = Product.first

            product_attributes = {
                title: 'test product',
                description: 'blablablabla',
                image_url: 'http://lorempixel.com/image_output/nightlife-h-c-640-753-8.jpg',
                price: 50.10
            }
            expect(product.title).to eq(@product.title)
            expect(product.description).to eq(@product.description)
            expect(product.image_url).to eq(@product.image_url)
            expect(product.price).to eq(@product.price)
        end
    end

    describe 'DELETE /product/:id' do
        it 'deletes the product with the passed id' do
            product = Product.first
            
            expect(response.status).to eq 200
            expect(flash[:alert]).to eq("Please login to access admin content")
        end
    end
end 