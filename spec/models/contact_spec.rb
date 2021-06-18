require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe "Validations" do
    before do
      @contact = Contact.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'john@doe.com',
        message: 'HI this is John Doe'
      )
      expect(@contact).to be_valid
    end

    it "is valid with valid attributes" do
      expect(@contact).to be_valid
    end

    it "is not valid without a first_name" do
      @contact.first_name = nil
      expect(@contact).to_not be_valid
    end

    it "is not valid without a last_name" do
      @contact.last_name = nil
      expect(@contact).to_not be_valid
    end

    it "is not valid without an email" do
      @contact.email = nil
      expect(@contact).to_not be_valid
    end

    it "is not valid without an message" do
      @contact.message = nil
      expect(@contact).to_not be_valid
    end
  end

  describe "name" do
    before do
      @contact = Contact.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'john@doe.com',
        message: 'HI this is John Doe'
      )
    end
    context "given a first name and last name" do
      it "returns full name" do
        expect(@contact.name).to eq('John Doe')
      end
    end
  end
end
