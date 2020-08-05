class BooksController < ApplicationController
    before_action :current_user
    def new
        @book = Book.new
        @book.build_category
    end
    
    def create
        byebug
        @book = @current_user.books.build(book_params)

        if @book.save
            redirect_to 'users/show'
        else
            redirect_to 'books/new'
        end
    end
   
    def index
        @books = Book.all
    end

    private

    def book_params
        params.require(:book).permit(:title, :author, :completed, category_attributes: [:name])
    end


end
