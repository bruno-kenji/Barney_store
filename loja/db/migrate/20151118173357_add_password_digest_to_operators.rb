class AddPasswordDigestToOperators < ActiveRecord::Migration
  def change
    add_column :operators, :password_digest, :string
  end
end
