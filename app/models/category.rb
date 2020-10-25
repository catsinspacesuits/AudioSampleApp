class Category < ApplicationRecord
    has_and belongs_to_many :samples

end
