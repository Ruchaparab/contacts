require 'rails_helper'

RSpec.describe 'Creating a contact', type: :feature do
  scenario 'with valid inputs' do
    visit new_contact_path
    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Eg. example@email.com', with: 'johndoe@example.com'
    fill_in 'Write us a message', with: 'This is a test message'
    click_on 'SEND MESSAGE'
    expect(page).to have_content('Contact was successfully created.')
  end

  scenario 'with invalid inputs' do
    visit new_contact_path
    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Doe'
    click_on 'SEND MESSAGE'
    expect(page).to have_content('Something went wrong. Please try again')
  end
end