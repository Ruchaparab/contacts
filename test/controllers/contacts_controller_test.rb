require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest

    test "should throw error when the contact is missing required fields" do
        post contacts_path, params: { contact: { first_name: "First name", last_name: "Last name"} }
      
        assert_redirected_to root_path(locale: "en")
        assert_equal "Something went wrong. Please try again", flash[:error]
    end

    test "should create contact" do
        assert_difference("Contact.count") do
          post contacts_path, params: { contact: { first_name: "First name", last_name: "Last name", email: "abc@xyz.com", message: "Test Message"} }
        end
      
        assert_redirected_to root_path(locale: "en")
        assert_equal "Contact was successfully created.", flash[:success]
    end
    
end