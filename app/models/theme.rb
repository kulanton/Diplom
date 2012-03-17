class Theme < ActiveRecord::Base
  has_many :sub_themes
  has_and_belongs_to_many :script
  belongs_to :discipline
  
  attr_reader :discipline_token
  
  def discipline_token=(id)
    self.discipline_id = id
  end
end
