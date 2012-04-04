class DisciplineYearBlock < ActiveRecord::Base
  belongs_to :discipline
  has_many :discipline_block_groups, :dependent => :destroy
  has_many :groups, :through => :discipline_block_groups
  has_and_belongs_to_many :tests, :join_table => 'discipline_group_tests'
  
  attr_reader :discipline_token, :group_tokens
  
  def discipline_token=(id)
    self.discipline_id = id
  end
  
  def group_tokens=(ids)
    self.group_ids = ids.split(",")
  end
end
