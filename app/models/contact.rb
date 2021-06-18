class Contact < ApplicationRecord
    validates_presence_of :first_name, :last_name, :message
    validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    phony_normalize :phone_number, default_country_code: 'IN'
    validates_plausible_phone :phone_number, allow_blank: false
    
    def name
        "#{self.first_name} #{self.last_name}"
    end
end
