class Script < ActiveRecord::Base
  has_and_belongs_to_many :sub_themes
  has_and_belongs_to_many :themes
  belongs_to :test

  validates :name, :presence => true
  validates :order, :presence => true
  validates :time, :presence => true
  
  attr_reader :theme_tokens
  
  def theme_tokens=(ids)
    self.theme_ids = ids.split(",")
  end
  
  attr_reader :sub_theme_tokens
  
  def sub_theme_tokens=(ids)
    self.sub_theme_ids = ids.split(",")
  end
end
