class AddDateAndTimeAsWellAsTitleToProjectsTable < ActiveRecord::Migration[6.1]

  def change
    add_column :projects, :title, :string 
    add_column :projects, :datetime, :string
  end

end
