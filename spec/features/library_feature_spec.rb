require 'rails_helper'

describe "creating a library", type: :feature do
  before :each do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    @library = FactoryBot.create(:library)
    @random_string = (0...8).map { (65 + rand(26)).chr }.join #random string generator
  end

  scenario "with valid inputs" do
    visit '/libraries/new'
    fill_in 'Name', with: @random_string
    click_button 'Create Library'
    expect(page).to have_content 'Library was successfully created.'
  end

  scenario "with invalid inputs" do 
    visit '/libraries/new'
    click_button 'Create Library'
    expect(page).to have_content 'Field is mandatory'
  end

  scenario "update with valid inputs" do 
    visit edit_library_path(@library)
    fill_in 'Name', with: 'blah blah' 
    click_button 'Update Library'
    expect(page).to have_content 'Library was successfully updated'
  end

  scenario "update with invalid inputs" do 
    visit edit_library_path(@library)
    fill_in 'Name', with: '' 
    click_button 'Update Library'
    expect(page).to have_content 'Field is mandatory'
  end
end