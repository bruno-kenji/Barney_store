class AddProductsToCategories < ActiveRecord::Migration
  def change
    add_reference :categories, :products
  end
end
