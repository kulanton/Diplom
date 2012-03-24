class Discipline < ActiveRecord::Base
  has_many :subjects, :dependent => :destroy, :before_add => :year_assign
  has_many :groups, :through => :subjects, :uniq => true
  has_and_belongs_to_many :repository_themes
  
  validates_presence_of :name
  
  attr_reader :repository_theme_tokens, :group_tokens
  
  def repository_theme_tokens=(ids)
    self.repository_theme_ids = ids.split(",")
  end
  
  def group_tokens=(ids)
    self.group_ids = ids.split(",")
  end
  
  def year_assign(subject)
    if subject.year.nil?
      subject.year = "2011/2012"
    end
  end
  
  def self.search(search)
    if search
      where('lower(name) LIKE lower(?)', "%#{search}%")
    else
      scoped
    end
  end

end
