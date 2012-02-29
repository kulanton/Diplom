class Script < ActiveRecord::Base
  has_many :themes
  belongs_to :test

  validates :name, :presence => true
  validates :order, :presence => true
  validates :time, :presence => true  
end
