class StoreController < ApplicationController
  skip_before_action :authorize
  def index
    @products = Product.all
    @categories = Category.all
  end

  def show
    
  end

  private
    def product_params
      params.require(:product).permit(:title, :description, :image_url, :price)
    end
end
