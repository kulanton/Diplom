class Script < ActiveRecord::Base
  has_many :themes
  belongs_to :test

  validates :name, :presence => true
  validates :order, :presence => true
  validates :time, :presence => true
  validates :blocked, :presence => true
  
  ORDER = ["Вразброс", "По порядку"]
  
  def get_order()
    ORDER[order]
  end
  
end
