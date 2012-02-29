class Discipline < ActiveRecord::Base
  has_and_belongs_to_many :groups
  has_many :themes
  
  validates :name, :presence => true
end
