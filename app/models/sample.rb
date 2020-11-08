class Sample < ApplicationRecord
  include AudioUploader::Attachment(:audio) # adds an `audio` virtual attribute
  acts_as_taggable_on :tags
  include PgSearch::Model
  pg_search_scope :search_by_title, 
  against: :title,
                  using: {
                    tsearch: {
                      highlight: {
                        StartSel: '<b>',
                        StopSel: '</b>',
                        MaxWords: 123,
                        MinWords: 456,
                        ShortWord: 4,
                        HighlightAll: true,
                        MaxFragments: 3,
                        FragmentDelimiter: '&hellip;'
                      }
                    }
                  }
  
  # associations
  has_many :sample_categories
  has_many :categories, through: :sample_categories
  # validations
  validates :title, :file_type, :audio_data, presence: { message: "Field is mandatory"}
  validates :title, uniqueness: { message: "Title already used. Please use another."}
  validates_associated :categories
end
