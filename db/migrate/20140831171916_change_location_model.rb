class ChangeLocationModel < ActiveRecord::Migration
  def change
    remove_column :locations, :state
    remove_column :locations, :city
    add_column :locations, :location_name, :string
  end
end
