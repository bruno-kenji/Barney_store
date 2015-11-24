class CategoriesController < ApplicationController
  skip_before_action :authorize, only:[:show]
  
  def index
    @categories = Category.all
  end

  def show
    set_category
    @products = Product.all
  end

  def new
    @category = Category.new
    @products = Product.all
  end

  def edit
    set_category
    @products = Product.all.map { |p| p.title }
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_url, notice: 'Category was successfully created.' }
        format.json { render :index, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    set_category
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_url, notice: 'Category was successfully updated.' }
        format.json { render :index, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    set_category
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :product_id)
  end

  def product_params
    params.require(:product).permit(:title, :description, :image_url, :price, :category_id)
  end
end
