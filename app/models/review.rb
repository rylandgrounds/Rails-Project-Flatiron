class Review < ApplicationRecord
    belongs_to :book
    belongs_to :user
    validates :content, presence: true
    validates :user_id , presence: true,  uniqueness: {scope: book_id, message: "Only one review per book!"}
    
    def creator
       @creator = User.find_by(id: self.user_id)
    end
end
