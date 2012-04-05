class Group < ActiveRecord::Base  
  has_and_belongs_to_many :blocks
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
end
