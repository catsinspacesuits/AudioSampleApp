# Converts UCS string into array of categories for category creation

class ConvertUCSString
  def convert_string_to_array(string)
    categories_array = string.split("\n")
    categories_array.map do |category|
      category.downcase.capitalize
    end 
  end
end

categories = ConvertUCSString.new
categories.convert_string_to_array(string)

# create categories from array

Category.create(final_array.map { |name| {name: name} })