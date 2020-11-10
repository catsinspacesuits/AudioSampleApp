class Library < ApplicationRecord
  has_many :sample_libraries
  has_many :samples, through: :sample_libraries
  # Validations
  validates :name, presence: { message: "Field is mandatory"}
  validates :name, uniqueness: { message: "Title already used. Please use another."}
end
