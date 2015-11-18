class AddedCategoriesProductsTable < ActiveRecord::Migration
  def change
    create_table :categories_products, id: false do |t|
        t.belongs_to :product
        t.belongs_to :category
    end
  end
end
