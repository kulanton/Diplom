class Test < ActiveRecord::Base
  has_many :scripts
  has_and_belongs_to_many :subjects

  validates_presence_of :name, :necessary, :block, :num_try, :order
  validates :num_try, :numericality => {:only_integer=>true,:greater_than=>0},:allow_blank => false
  validates :period, :numericality => {:only_integer=>true,:greater_than=>0},:allow_blank => false
  validates :order, :numericality => {:only_integer=>true,:greater_than=>0},:allow_blank => false
  
  attr_reader :subject_tokens
  
  def subject_tokens=(ids)
    self.subject_ids = ids.split(",")
  end
  
  TYPES = [["Тип 1", 1], ["Тип 2", 2], ["Тип 3", 3]]
  
  def types
	TYPES
  end
  
  def auth_types
    [["Портал", 1], ["Main Msiu", 2], ["ИДО", 3]]
  end
  
end
