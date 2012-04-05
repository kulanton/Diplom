class Block < ActiveRecord::Base
  belongs_to :discipline
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :tests
  
  attr_reader :discipline_token, :group_tokens
  
  def discipline_token=(id)
    self.discipline_id = id
  end
  
  def group_tokens=(ids)
    self.group_ids = ids.split(",")
  end
end
