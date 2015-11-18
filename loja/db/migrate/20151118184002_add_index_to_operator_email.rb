class AddIndexToOperatorEmail < ActiveRecord::Migration
  def change
    add_index :operators, :email, unique: true
  end
end
