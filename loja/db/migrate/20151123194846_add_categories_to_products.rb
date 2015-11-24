class AddCategoriesToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :categories
  end
end
