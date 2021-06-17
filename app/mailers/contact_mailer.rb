class ContactMailer < ApplicationMailer

    def send_contact_information_email(contact)
        @contact = contact
        mail(to: 'info@ajackus.com', subject: "You have received a new message")
    end
end
