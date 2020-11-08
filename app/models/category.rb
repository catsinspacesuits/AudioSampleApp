class Category < ApplicationRecord
  has_many :sample_categories
  has_many :samples, through: :sample_categories

  # Validations
  validates :name, presence: { message: "Field is mandatory"}
  validates :name, uniqueness: { message: "Title already used. Please use another."}
end
