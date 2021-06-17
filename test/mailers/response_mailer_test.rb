require 'test_helper'

class ResponseMailerTest < ActionMailer::TestCase
  def setup
    @contact = contacts(:one)
  end

  test 'mail_notification' do
    response_email = ResponseMailer.send_email_to_contact_person(@contact)
    assert_emails 1 do
      response_email.deliver_now
    end
    assert_not ActionMailer::Base.deliveries.empty?
    
    assert response_email.to.include?(@contact.email)
    assert response_email.subject.include?('Thank you for your message')
    assert response_email.body.encoded.include?('We have recieved your message. We will reach out to you shortly')
  end
end