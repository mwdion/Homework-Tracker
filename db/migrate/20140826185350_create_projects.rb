class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.date :date
      t.text :description
      t.text :requirements
      t.string :workflow_state
      t.timestamps
    end
  end
end
