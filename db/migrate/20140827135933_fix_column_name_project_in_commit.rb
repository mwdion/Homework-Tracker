class FixColumnNameProjectInCommit < ActiveRecord::Migration
  def change
    remove_column :commits, :porject_id
    add_column :commits, :project_id, :integer
  end
end
