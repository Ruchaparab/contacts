require 'rails_helper'

RSpec.describe "Contacts", type: :request do
  let(:valid_attributes) { 
      {
         first_name: "John", 
         last_name:  "Doe",
         email: "johndoe@example.com",
         phone_number: "9898009900",
         message: "This is a test message"
      } 
    }

    let(:invalid_attributes) {
      {
          first_name: "First name",
          last_name: "Last name"
      }
    }

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Contact" do
        expect {
          post contacts_path, params: { contact: valid_attributes }
        }.to change(Contact, :count).by(1)
      end

      it "redirects to the root with success message" do
        post contacts_path, params: { contact: valid_attributes }
        expect(response).to redirect_to(root_path(locale: "en"))
        expect(flash[:success]).to eq('Contact was successfully created.')
      end
    end

    context "with invalid parameters" do
      it "does not create a new Contact" do
        expect {
          post contacts_path, params: { contact: invalid_attributes }
        }.to change(Contact, :count).by(0)
      end

      it "renders a error response " do
        post contacts_path, params: { contact: invalid_attributes }
        expect(response).to_not be_successful
        expect(flash[:error]).to eq('Something went wrong. Please try again')
      end
    end
  end   
  
end
