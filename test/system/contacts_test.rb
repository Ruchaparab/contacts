require "application_system_test_case"

class ContactsTest < ApplicationSystemTestCase
  setup do
    @contact = contacts(:one)
  end

  test "creating a contact" do
    visit new_contact

    fill_in "Email", with: @contact.email
    fill_in "First name", with: @contact.first_name
    fill_in "Last name", with: @contact.last_name
    fill_in "Message", with: @contact.message
    fill_in "Phone number", with: @contact.phone_number
    click_on "Create Contact"

    assert_text "Contact was successfully created"
  end

end
