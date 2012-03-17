class DisciplinesGroups < ActiveRecord::Base
  belongs_to :discipline
  belongs_to :group
  has_many :tests
  
  attr_reader :name
  @name = "name"
  
  def name
    self.discipline.name+" - "+self.group.name+" - "+self.group.year
  end
  def attributes
    {'id' => id, 'name' => name}
  end
end
