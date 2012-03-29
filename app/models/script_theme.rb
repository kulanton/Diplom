class ScriptTheme < ActiveRecord::Base
  belongs_to :repository_theme
  belongs_to :script
  has_many :script_sub_themes, :dependent => :destroy
  accepts_nested_attributes_for :script_sub_themes, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  
  validates_presence_of :name, :questions_to_pass, :subthemes_to_pass
end
