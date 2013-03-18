class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.integer :folder_id
      t.string :title
      t.text :content

      t.timestamps
    end
    add_index :documents, :folder_id
    add_index :documents, :title
    add_index :documents, [:folder_id, :title], unique: true
  end
end
