class Theme < ActiveRecord::Base
  has_many :sub_themes
  belongs_to :script
end
