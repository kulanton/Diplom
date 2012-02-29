class Theme < ActiveRecord::Base
  has_many :sub_themes
  has_and_belongs_to_many :script
  belongs_to :discipline
end
