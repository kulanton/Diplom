class ScriptTheme < ActiveRecord::Base
  default_scope order(:name)

  belongs_to :repository_theme
  belongs_to :script
  has_many :script_sub_themes, :dependent => :destroy
  accepts_nested_attributes_for :script_sub_themes, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  
  validates_presence_of :name, :questions_to_pass, :subthemes_to_pass
  
  def repository_theme_name
    repository_theme.name if repository_theme
  end
  
  def repository_theme_name=(name)
    self.repository_theme = RepositoryTheme.find_by_name(name) unless name.blank?
  end
end
