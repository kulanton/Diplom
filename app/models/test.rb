class Test < ActiveRecord::Base
  has_many :scripts
  belongs_to :disciplines_groups

  validates :name, :presence => true
  validates :necessary, :presence => true
  validates :block, :presence => true
  validates :num_try, :presence => true
  validates :order, :presence => true
  validates :num_try, :numericality => {:only_integer=>true,:greater_than=>0},:allow_blank => false
  validates :period, :numericality => {:only_integer=>true,:greater_than=>0},:allow_blank => false
  validates :order, :numericality => {:only_integer=>true,:greater_than=>0},:allow_blank => false
  
  attr_reader :disciplines_groups_token
  
  def disciplines_groups_token=(id)
    self.disciplines_groups_id = id
  end
  
  TYPES = [["Тип 1", 1], ["Тип 2", 2], ["Тип 3", 3]]
  
  def types
	TYPES
  end
  
  def auth_types
    [["Портал", 1], ["Main Msiu", 2], ["ИДО", 3]]
  end
  
end
