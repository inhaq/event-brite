class User < ApplicationRecord
    before_create :generate_token
    has_many :events,dependent: :destroy
    has_many :attendees,through: :events,dependent: :destroy
    validates :email, presence: true
    def remember_token
        SecureRandom.urlsafe_base64
    end
    def encrypt_token
        Digest::SHA1.hexdigest(remember_token.to_s)
    end

    def self.listUser(list)
        User.where(id: list.collect(&:invitee))
    end
    
    private
    def generate_token
        self.remember_token = encrypt_token
    end
end
