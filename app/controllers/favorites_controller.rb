class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @favorite = current_user.favorites.create(book_id: params[:book_id])
  end

  def destroy
    @favorite = current_user.favorites.find_by(id: params[:id]).destroy
    @book = @favorite.book
  end
end
