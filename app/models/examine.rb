class Examine < ActiveRecord::Base
  has_and_belongs_to_many :blocks
  
  has_many :scripts, :dependent => :destroy
  accepts_nested_attributes_for :scripts, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

  validates_presence_of :name, :num_try, :period #, :test_type
  validates :num_try, :numericality=>{:only_integer=>true},:allow_blank=>false
  validates :period, :numericality=>{:only_integer=>true},:allow_blank=>false
  
end
