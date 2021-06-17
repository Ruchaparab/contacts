require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  def setup
    @contact = contacts(:one)
  end

  test 'mail_notification' do
    contact_email = ContactMailer.send_contact_information_email(@contact)
    assert_emails 1 do
      contact_email.deliver_now
    end
    assert_not ActionMailer::Base.deliveries.empty?
    
    assert_equal contact_email.to, ['info@ajackus.com']
    assert contact_email.subject.include?('You have received a new message')
    assert contact_email.body.encoded.include?(@contact.message)
  end
end