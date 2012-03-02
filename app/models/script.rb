class Script < ActiveRecord::Base
  has_and_belongs_to_many :themes
  belongs_to :test

  validates :name, :presence => true
  validates :order, :presence => true
  validates :time, :presence => true
  
  attr_reader :theme_tokens
  
  def theme_tokens=(ids)
    self.theme_ids = ids.split(",")
  end
end
