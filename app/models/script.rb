class Script < ActiveRecord::Base
  belongs_to :test
  has_many :script_themes, :dependent => :destroy
  accepts_nested_attributes_for :script_themes, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  
  validates_presence_of :name, :redirect_page, :time, :results, :questions_to_pass, :themes_to_pass
  
end
