class Category < ApplicationRecord
  has_many :sample_categories
  has_many :samples, through: :sample_categories
end
