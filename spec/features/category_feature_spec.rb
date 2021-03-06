require 'rails_helper'

describe "creating a category", type: :feature do
  before :each do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    @category = FactoryBot.create(:category)
    @random_string = (0...8).map { (65 + rand(26)).chr }.join #random string generator
  end

  scenario "with valid inputs" do
    visit '/categories/new'
    fill_in 'Name', with: @random_string
    click_button 'Create Category'
    expect(page).to have_content 'Category was successfully created.'
  end

  scenario "with invalid inputs" do 
    visit '/categories/new'
    click_button 'Create Category'
    expect(page).to have_content 'Field is mandatory'
  end

  scenario "update with valid inputs" do 
    visit edit_category_path(@category)
    fill_in 'Name', with: 'blah blah' 
    click_button 'Update Category'
    expect(page).to have_content 'blah blah'
  end

  scenario "update with invalid inputs" do 
    visit edit_category_path(@category)
    fill_in 'Name', with: '' 
    click_button 'Update Category'
    expect(page).to have_content 'Field is mandatory'
  end
end