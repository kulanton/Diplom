class Examine < ActiveRecord::Base
  has_and_belongs_to_many :blocks
  
  has_many :scripts, :dependent => :destroy
  accepts_nested_attributes_for :scripts, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

  validates_presence_of :name, :num_try, :test_type, :auth_type, :period
  validates :num_try, :numericality=>{:only_integer=>true,:greater_than=>0},:allow_blank=>false
  validates :period, :numericality=>{:only_integer=>true,:greater_than=>0},:allow_blank=>false
  
  def types
	[["Тип 1", 1], ["Тип 2", 2], ["Тип 3", 3]]
  end
  
  def auth_types
    [["Портал", 1], ["Main Msiu", 2], ["ИДО", 3]]
  end
end
