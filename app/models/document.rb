class Document < ActiveRecord::Base
  attr_accessible :title, :content, :folder_id
  belongs_to :folder

  validates_presence_of :title, :content, :folder_id

  def path
    begin
      File.join(folder.path, title).gsub(/\s/, '_').downcase
    rescue NoMethodError
      File.join(folder.sub_path, title).gsub(/\s/, '_').downcase
    end
  end
end
