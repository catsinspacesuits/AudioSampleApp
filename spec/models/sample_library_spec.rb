require 'rails_helper'

RSpec.describe 'SampleLibrary validations' do   
  describe SampleLibrary do

    it 'is an ApplicationRecord' do
      is_expected.to be_an(ApplicationRecord)
    end     
    
    # Associations
    describe 'associations' do
      it { should belong_to(:sample) }
      it { should belong_to(:library) }
    end
  end
end