class ContactMailerPreview < ActionMailer::Preview
    def send_contact_information_email  
      contact = Contact.last
      ContactMailer.send_contact_information_email(contact)  
    end
end