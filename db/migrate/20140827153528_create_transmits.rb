class CreateTransmits < ActiveRecord::Migration
  def change
    create_table :transmits do |t|
      t.string :name
      t.text :github_link
      t.text :heroku_link
      t.text :other_link
      t.text :content
      t.integer :user_id
      t.integer :project_id
      t.timestamps
    end
  end
end
