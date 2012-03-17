class SubTheme < ActiveRecord::Base
  belongs_to :theme
  has_and_belongs_to_many :scripts
  
  ORDER = ["Вразброс", "По порядку"]
  
  def get_order()
    ORDER[order]
  end
end
