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
end
