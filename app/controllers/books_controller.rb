class BooksController < ApplicationController
    before_action :current_user
    
    def new
        @book = Book.new
    end
    
    def create
        byebug
        @book = @current_user.books.build(book_params)
        if @book.save
            byebug
            redirect_to 'users/show'
        else
            redirect_to 'books/new'
        end
    end

    private

    def book_params
        params.require(:book).permit(:title, :author)
    end


end
