class Contact < ApplicationRecord
    validates_presence_of :first_name, :email, :message

    def name
        "#{self.first_name} #{self.last_name}"
    end
end
