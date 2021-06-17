class ContactsController < ApplicationController

  def new
    @contacts = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      ContactMailer.send_contact_information_email(@contact).deliver_later
      ResponseMailer.send_email_to_contact_person(@contact).deliver_later
      flash[:success] = t('contacts.controller.create.success')
      redirect_to root_path
    else
      flash[:error] = t('contacts.controller.create.error')
      redirect_to root_path
    end
  end


  private

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email, :phone_number, :message)
    end
end
