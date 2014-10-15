class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :name
      t.date :date
      t.integer :requirements

      t.timestamps
    end
  end
end
