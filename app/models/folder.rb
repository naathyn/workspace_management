class Folder < ActiveRecord::Base
  attr_accessible :name, :directory_id, :subfolder_id

  belongs_to :directory
  belongs_to :subfolder, foreign_key: "subfolder_id", class_name: "Folder"

  has_many :documents, dependent: :destroy
  has_many :subfolders, foreign_key: "subfolder_id", class_name: "Folder", dependent: :destroy

  validates_presence_of :name

  def path
    begin
      File.join(directory.name, name).gsub(/\s/, '_').downcase
    rescue NoMethodError
      File.join(subfolder.directory.name, subfolder.name, name).
        gsub(/\s/, '_').downcase
    end
  end
end
