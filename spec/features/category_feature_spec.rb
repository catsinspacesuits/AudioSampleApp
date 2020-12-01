require 'rails_helper'

describe "creating a sample", type: :feature do
  before :each do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    @sample = FactoryBot.create(:sample)
    @random_string = (0...8).map { (65 + rand(26)).chr }.join #random string generator
  end

  scenario "with valid inputs" do
    visit '/samples/new'
    fill_in 'Title', with: @random_string
    fill_in 'Description', with: 'blah blah description here.'
    fill_in 'Tag List', with: 'cat, rain, scotland'
    select "wav", from: 'File type'
    fill_in 'File size', with: '3.5'
    select 'stereo', from: 'Channels'
    select '96kHz/24-bit', from: 'Sample rate'
    attach_file('Audio', Rails.root + 'spec/fixtures/splash.wav')
    click_button 'Create Sample'
    
    expect(page).to have_content 'Sample was successfully created.'
  end

  scenario "with invalid inputs" do 
    visit '/samples/new'
    click_button 'Create Sample'
    expect(page).to have_content 'Title Field is mandatory'
  end

  scenario "update with valid inputs" do 
    visit edit_sample_path(@sample)
    fill_in 'Description', with: 'blah blah' 
    click_button 'Update Sample'
    expect(page).to have_content 'blah blah'
  end

  scenario "update with invalid inputs" do 
    visit edit_sample_path(@sample)
    fill_in 'Title', with: '' 
    click_button 'Update Sample'
    expect(page).to have_content 'Title Field is mandatory'
  end
end