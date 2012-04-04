class Group < ActiveRecord::Base  
  has_many :discipline_block_groups, :dependent => :destroy
  has_many :discipline_year_blocks, :through => :discipline_block_groups
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
end
