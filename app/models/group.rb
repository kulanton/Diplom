class Group < ActiveRecord::Base
  has_many :subjects, :dependent => :destroy
  has_many :disciplines, :through => :subjects #, :uniq => true
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  # attr_reader :discipline_tokens
  
  # def discipline_tokens=(ids)
  #   self.discipline_ids = ids.split(",")
  # end
end
