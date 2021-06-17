class Contact < ApplicationRecord
    validates_presence_of :first_name, :email, :message
end
