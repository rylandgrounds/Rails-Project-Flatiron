class Review < ApplicationRecord
    belongs_to :book
    belongs_to :user

    def creator
       @creator = User.find_by(id: self.user_id)
    end
end
