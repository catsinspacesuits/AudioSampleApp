class Sample < ApplicationRecord
  include AudioUploader::Attachment(:audio) # adds an `audio` virtual attribute
  acts_as_taggable_on :tags
  include PgSearch::Model
  # search title first then description
  pg_search_scope :search_by_title, against: {
    title: 'A',
    description: 'B'
  }
  # associations
  has_many :sample_libraries
  has_many :libraries, through: :sample_libraries
  has_many :sample_categories
  has_many :categories, through: :sample_categories
  # validations
  validates :title, :file_type, :audio_data, :channels, :file_size, :sample_rate, presence: { message: "Field is mandatory"}
  validates :title, uniqueness: { message: "Title already used. Please use another."}
  validates_associated :categories
end
