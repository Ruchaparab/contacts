class ResponseMailer < ApplicationMailer

    def send_email_to_contact_person(contact)
        @contact = contact
        mail(to: @contact.email, subject: 'Thank you for your message')
    end
end
