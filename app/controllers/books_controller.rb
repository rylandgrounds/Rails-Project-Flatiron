class BooksController < ApplicationController
   
    
    
    def new
        @book = Book.new
    end
    
    def create
        @book = current_user.books.build(book_params)
        if @book.save
            redirect_to user_path(current_user)
        else
            redirect_to :new
        end
    end
   
    def index
        
        @books = Book.alpha
    end

        def show
            @review = Review.new
            @book = Book.find(params[:id])
        end

 
        def destroy
            Book.find(params[:id]).destroy
           redirect_to user_path(current_user)
          end

    private

    def book_params
        params.require(:book).permit(:title, :author, :completed)
    end


end
