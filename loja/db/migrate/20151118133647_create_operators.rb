class CreateOperators < ActiveRecord::Migration
  def change
    create_table :operators do |t|
      t.string :name, :email, presence: true
      t.timestamps
    end
  end
end
