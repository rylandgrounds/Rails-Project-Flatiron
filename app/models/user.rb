class User < ApplicationRecord
    has_secure_password
    has_many :reviews
    has_many :books, through: :reviews
    validates :username , presence: true,  uniqueness: true

    def self.find_or_create_by_omniauth(auth_hash)
        self.where(username: auth_hash.info.username).first_or_create do |user|
            user.password = SecureRandom.hex
        end
    end
end
