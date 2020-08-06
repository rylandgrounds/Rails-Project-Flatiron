class Book < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    validates :title, presence: true
    validates :author, presence: true
   


    def status
        if self.completed == true
            'Yes!'
        else
            'No!'
        end
    end
end
