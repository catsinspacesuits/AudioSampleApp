require 'rails_helper'

RSpec.describe 'SampleCategory validations' do   
  describe SampleCategory do

    it 'is an ApplicationRecord' do
      is_expected.to be_an(ApplicationRecord)
    end     
    
    # Associations
    describe 'associations' do
      it { should belong_to(:sample) }
      it { should belong_to(:category) }
    end

  end
end