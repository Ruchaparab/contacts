class ResponseMailerPreview < ActionMailer::Preview
    def send_email_to_contact_person  
      contact = Contact.last
      ResponseMailer.send_email_to_contact_person(contact)  
    end
end