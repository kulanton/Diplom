class DisciplinesGroups < ActiveRecord::Base
  belongs_to :discipline
  belongs_to :group
  has_many :tests
end
