class Discipline < ActiveRecord::Base
  has_and_belongs_to_many :repository_themes
  has_many :blocks, :class_name => 'DisciplineYearBlock'
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  attr_reader :repository_theme_tokens
  
  def repository_theme_tokens=(ids)
    self.repository_theme_ids = ids.split(",")
  end
  
  def self.search(search)
    if search
      where('lower(name) LIKE lower(?)', "%#{search}%")
    else
      scoped
    end
  end

end
