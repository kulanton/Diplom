class ScriptSubTheme < ActiveRecord::Base
  default_scope order(:name)

  belongs_to :script_theme
  
  validates_presence_of :name, :start_num, :end_num, :questions_to_pass, :questions_count
end
