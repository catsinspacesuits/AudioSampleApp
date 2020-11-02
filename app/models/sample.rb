class Sample < ApplicationRecord
  include AudioUploader::Attachment(:audio) # adds an `audio` virtual attribute

  acts_as_taggable_on :tags

  has_many :sample_categories
  has_many :categories, through: :sample_categories
end
