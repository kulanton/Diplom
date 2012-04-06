class Block < ActiveRecord::Base
  belongs_to :discipline
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :tests
  has_and_belongs_to_many :examines
  
  attr_reader :discipline_token, :group_tokens
  
  def years
    i = 1
    hash = []
    for year in Time.now.year-2...Time.now.year+2
      hash << ["#{year}/#{year+1}", i] 
      i += 1
    end
    hash
  end
  
  def discipline_token=(id)
    self.discipline_id = id
  end
  
  def group_tokens=(ids)
    self.group_ids = ids.split(",")
  end
end
