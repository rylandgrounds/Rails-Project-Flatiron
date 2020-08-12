class Book < ApplicationRecord
    belongs_to :user
    has_many :reviews
    has_many :users, through: :reviews
    validates :title, presence: true
    validates :author, presence: true
   

    def self.alpha
        Book.order(title: :asc)
    end


    def status
        if self.completed == true
            'Yes!'
        else
            'No!'
        end
    end
end
