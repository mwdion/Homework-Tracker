class FixUserModelColumns < ActiveRecord::Migration
  def change
    remove_column :users, :location_id
    add_column :users, :unit_id, :integer
  end
end
