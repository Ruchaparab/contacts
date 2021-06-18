class Contact < ApplicationRecord
    validates_presence_of :first_name, :last_name, :message
    validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    
    def name
        "#{self.first_name} #{self.last_name}"
    end
end
