class Subject < ActiveRecord::Base
  belongs_to :discipline
  belongs_to :group
  
  has_and_belongs_to_many :tests
  
  validates_presence_of :year
  
  attr_reader :name
  
  def name
    self.discipline.name+" - "+self.group.name+" - "+self.year
  end
  
  def attributes
    {
      'id' => id, 
      'name' => name,
      'year' => year,
      'bloc' => bloc,
      'discipline_id' => discipline_id,
      'group_id' => group_id
    }
  end
end
