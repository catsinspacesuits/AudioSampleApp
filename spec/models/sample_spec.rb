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
