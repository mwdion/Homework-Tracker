class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.integer :unit_id
      t.integer :user_id

      t.timestamps
    end
  end
end
