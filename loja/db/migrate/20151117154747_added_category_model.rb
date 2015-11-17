class AddedCategoryModel < ActiveRecord::Migration
  def change
    create_table :categories do |t|
        t.string :title
        t.timestamps
    end
    create_table :products_categories, id: false do |t|
        t.belongs_to :product
        t.belongs_to :category
    end
    change_column :products, :title, :string, :default => 'Untitled'
  end
end
