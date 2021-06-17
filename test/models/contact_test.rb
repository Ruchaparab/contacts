require "test_helper"

class ContactTest < ActiveSupport::TestCase

    test "should not save contact without first name, last_name, email and message" do
        contact = Contact.new
        assert_not contact.save, "Mandatory field/(s) missing"
    end

    test "should create contact succesfully" do
        contact = Contact.new
        contact.first_name = "First Name"
        contact.last_name = "Last Name"
        contact.email = "test@mockup.com"
        contact.phone_number = "1234567890"
        contact.message = "This is a test contact message"
        contact.save
        assert contact.persisted?, "Contact saved successfully"
    end

    test "should be able to get name" do
        contact = contacts(:one)
        assert_equal "John Doe", contact.name
    end
end