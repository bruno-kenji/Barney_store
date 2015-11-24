class ProductsController < ApplicationController
  skip_before_action :authorize, only:[:show]
  before_action :set_product, :set_category, only:[:show, :edit, :update, :destroy]
  
  def index
    @products = Product.all
  end

  def show
    @product = Product.includes(:categories).find(params[:id])
  end

  def new
    @product = Product.new
    @categories = Category.all.map { |c| [ c.title, c.id ] }
  end

  def edit
    @categories = Category.all.map{ |c| c.title }
  end

  def create
    @product = Product.new(product_params)
    @product.categories_id = params[:categories_id]

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @product.categories_id = params[:categories_id]

    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def set_category
      @category = Category.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :description, :image_url, :price, :category_id)
    end

    def category_params
      params.require(:category).permit(:title, :product_id)
    end
end
