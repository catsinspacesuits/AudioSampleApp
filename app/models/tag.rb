class Tag < ApplicationRecord
    has_and belongs_to_many :samples
end
