class AddOperatorsToSector < ActiveRecord::Migration
  def change
    add_reference :sectors, :operators
  end
end
