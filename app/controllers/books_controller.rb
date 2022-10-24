class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @favorite = current_user.favorites.find_by(book_id: @book.id)
    #@like = current_user.like_reviews
  end
end
