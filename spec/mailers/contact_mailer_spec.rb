require 'rails_helper'

RSpec.describe ContactMailer, type: :mailer do
    describe 'email' do
        before do
            @contact = Contact.create(
                first_name: 'John',
                last_name: 'Doe',
                email: 'johndoe@example.com',
                message: 'Hi this is a test message'
            )
    
            @email = ContactMailer.send_contact_information_email(@contact)
        end
    
        it 'renders the subject' do
            expect(@email.subject).to eq('You have received a new message')
        end
    
        it 'renders the recievers email' do
            expect(@email.to).to eq(['info@ajackus.com'])
        end
    
        it 'renders name for contact' do
            expect(@email.body.encoded).to match(@contact.name)
        end

        it 'renders email for contact' do
            expect(@email.body.encoded).to match(@contact.email)
        end
    
        it 'renders message for contact' do
            expect(@email.body.encoded).to match(@contact.message)
        end
    end
end