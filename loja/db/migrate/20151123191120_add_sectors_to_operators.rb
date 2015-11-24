class AddSectorsToOperators < ActiveRecord::Migration
  def change
    add_reference :operators, :sector
  end
end
