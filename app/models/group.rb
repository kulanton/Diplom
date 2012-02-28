class Group < ActiveRecord::Base
  has_and_belongs_to_many :disciplines
  
  attr_reader :discipline_tokens
  
  def discipline_tokens=(ids)
    self.discipline_ids = ids.split(",")
  end
end
