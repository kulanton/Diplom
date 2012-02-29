class SubTheme < ActiveRecord::Base
  belongs_to :theme
  
  ORDER = ["Вразброс", "По порядку"]
  
  def get_order()
    ORDER[order]
  end
end
