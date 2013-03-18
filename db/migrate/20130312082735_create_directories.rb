class CreateDirectories < ActiveRecord::Migration
  def change
    create_table :directories do |t|
      t.string :name

      t.timestamps
    end
    add_index :directories, :name, unique: true
  end
end
