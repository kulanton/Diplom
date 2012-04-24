class Script < ActiveRecord::Base
  default_scope order(:name)

  belongs_to :examine
  has_many :script_themes, :dependent => :destroy
  accepts_nested_attributes_for :script_themes, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  
  validates_presence_of :name, :redirect_page, :time, :questions_to_pass, :themes_to_pass # , :results
end
