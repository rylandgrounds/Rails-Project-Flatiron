class ReviewsController < ApplicationController
   before_action :require_login
   before_action :require_ownership, only: [:edit, :update]
    
   def new
        @review = Review.new
        @book = Book.find_by(id: params[:book_id])
    end
    
    def create
        @review = Review.new(review_params) 
        @review.book_id = params[:book_id]
        @review.user_id = current_user.id
        if @review.save
            redirect_to review_path(@review)
        else 
            render "new"
        end
    end
    
    def show
        @review = Review.find_by(id: params[:id])
    end

    def index
        @book = Book.find_by(id: params[:book_id])
        @reviews = @book.reviews
    end
    
    def edit
        @review = Review.find_by(id: params[:id])
    end

    def update
        if @review.update(review_params)
            redirect_to review_path(@review)
        else
            render :edit
        end
    end

    private
    def review_params
        params.require(:review).permit(:content)
    end

end
