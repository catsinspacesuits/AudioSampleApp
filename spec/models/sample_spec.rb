require 'rails_helper'

RSpec.describe 'Sample validations' do   
  describe Sample do

    it 'is an ApplicationRecord' do
      is_expected.to be_an(ApplicationRecord)
    end     

    # Validations
    describe 'validations' do
      it { should validate_presence_of(:title).with_message("Field is mandatory") }
      it { should validate_presence_of(:file_type).with_message("Field is mandatory") }
      it { should validate_presence_of(:audio_data).with_message("Field is mandatory") }
      it { should validate_uniqueness_of(:title).with_message("Title already used. Please use another.") }
    end
    
    # Associations
    describe 'associations' do
      it { should have_many(:categories).through(:sample_categories) }
      it { should have_many(:sample_categories) }
    end

  end
end

# describe "ActiveModel validations" do
#     it { expect(bodybuilder).to validate_presence_of(:food).with_message(/you can't get big without your protein!/) }
#     it { expect(developer).to validate_presence_of(:favorite_coffee) }
#     it { expect(meal).to validate_numericality_of(:price) }
#     it { expect(tumblog).to validate_numericality_of(:follower_count).only_integer }
#     it { expect(odd_number).to validate_numericality_of(:value).odd }
#     it { expect(even_number).to validate_numericality_of(:value).even }
#     it { expect(mercedes).to validate_numericality_of(:price).is_greater_than(30000) }
#     it { expect(junked_car).to validate_numericality_of(:price).is_less_than_or_equal_to(500) }
#     it { expect(blog_post).to validate_uniqueness_of(:title) }
#     it { expect(wishlist).to validate_uniqueness_of(:product).scoped_to(:user_id, :wishlist_id).with_message("You can only have an item on your wishlist once.") }

#     # Format validations
#     it { expect(user).to allow_value("JSON Vorhees").for(:name) }
#     it { expect(user).to_not allow_value("Java").for(:favorite_programming_language) }
#     it { expect(user).to allow_value("dhh@nonopinionated.com").for(:email) }
#     it { expect(user).to_not allow_value("base@example").for(:email) }
#     it { expect(user).to_not allow_value("blah").for(:email) }
#     it { expect(blog).to allow_blank(:connect_to_facebook) }
#     it { expect(blog).to allow_nil(:connect_to_facebook) }

#     # Inclusion/acceptance of values
#     it { expect(tumblog).to ensure_inclusion_of(:status).in_array(['draft', 'public', 'queue']) }
#     it { expect(tng_group).to ensure_inclusion_of(:age).in_range(18..35) }
#     it { expect(band).to ensure_length_of(:bio).is_at_least(25).is_at_most(1000) }
#     it { expect(tweet).to ensure_length_of(:content).is_at_most(140) }
#     it { expect(applicant).to ensure_length_of(:ssn).is_equal_to(9) }
#     it { expect(contract).to validate_acceptance_of(:terms) }  # For boolean values
#     it { expect(user).to validate_confirmation_of(:password) }  # Ensure two values match
#   end