class CreateProjectsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.text :content
      t.integer :user_id

      t.timestamps null: false
    end
  end
end