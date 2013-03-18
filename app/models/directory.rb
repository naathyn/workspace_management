class Directory < ActiveRecord::Base
  attr_accessible :name

  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false

  has_many :folders, dependent: :destroy
  has_many :documents, through: :folders
end
