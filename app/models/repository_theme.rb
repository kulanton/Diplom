class RepositoryTheme < ActiveRecord::Base
  has_and_belongs_to_many :disciplines
end
