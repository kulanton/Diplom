class DisciplineBlockGroup < ActiveRecord::Base
  belongs_to :group
  belongs_to :discipline_year_block
end
