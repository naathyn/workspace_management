class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.integer :directory_id
      t.integer :subfolder_id
      t.string :name

      t.timestamps
    end
    add_index :folders, :directory_id
    add_index :folders, :subfolder_id
    add_index :folders, :name
    add_index :folders, [:directory_id, :name], unique: true
    add_index :folders, [:subfolder_id, :name], unique: true
  end
end
