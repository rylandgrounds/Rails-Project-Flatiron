class BooksController < ApplicationController
    before_action :current_user
    
    
    def new
        @book = Book.new
    end
    
    def create
        @book = @current_user.books.build(book_params)
        if @book.save
            redirect_to user_path(@current_user)
        else
            redirect_to 'books/new'
        end
    end
   
    def index
        @books = Book.all.order(created_at: :desc)
    end

        def show
            @review = Review.new
            @book = Book.find(params[:id])
        end

 
        def destroy
            Book.find(params[:id]).destroy
           redirect_to user_path(@current_user)
          end

    private

    def book_params
        params.require(:book).permit(:title, :author, :completed)
    end


end
