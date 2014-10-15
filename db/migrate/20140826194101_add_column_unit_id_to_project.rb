class AddColumnUnitIdToProject < ActiveRecord::Migration
  def change
    add_column :projects, :unit_id, :integer
  end
end
