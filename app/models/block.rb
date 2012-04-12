class Block < ActiveRecord::Base
  before_create :assign_block_num

  belongs_to :discipline
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :examines, :order => :ordinal
  
  validates_presence_of :year
  
  attr_reader :group_tokens
  
  def discipline_name()
    discipline.name if discipline
  end
  
  def discipline_name=(name)
    self.discipline = Discipline.find_or_create_by_name(name) unless name.blank?
  end
  
  def group_tokens=(ids)
    self.group_ids = ids.split(",")
  end
  
  private
  
  def assign_block_num
    num = Block.maximum('block_num')
    if num.nil?
      self.block_num = 1
    else
      self.block_num = num + 1
    end
  end
end
