class User < ApplicationRecord
    has_secure_password
    has_many :books #Books they have created
    has_many :reviews
    has_many :reviewed_books, through: :reviews, source: :book
    validates :email , presence: true,  uniqueness: true

    def self.find_or_create_by_omniauth(auth_hash)
        self.where(email: auth_hash.info.email).first_or_create do |user|
            user.password = SecureRandom.hex
        end
    end
    def self.find_user(params)
        @user = User.find_by(email: params[:email])
    end
end
