require 'rails_helper'

RSpec.describe 'Library validations' do   
  describe Library do

    it 'is an ApplicationRecord' do
      is_expected.to be_an(ApplicationRecord)
    end     

    # Validations
    describe 'validations' do
      it { should validate_presence_of(:name).with_message("Field is mandatory") }
      it { should validate_uniqueness_of(:name).with_message("Title already used. Please use another.") }
    end
    
    # Associations
    describe 'associations' do
      it { should have_many(:samples).through(:sample_libraries) }
      it { should have_many(:sample_libraries) }
    end

  end
end
