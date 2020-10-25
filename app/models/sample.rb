class Sample < ApplicationRecord
  has_and belongs_to_many :categories, :tags
end
