class Book < ApplicationRecord
    belongs_to :category
    has_many :users
    has_many :reviews, through: :users
    #accepts_nested_attributes_for :category
    validates :title, presence: true
    validates :author, presence: true
   

        def category_attributes=(attr)
            Category.find_or_create_by(attr)
        end
    def status
        if self.completed == true
            'Yes!'
        else
            'No!'
        end
    end
end
