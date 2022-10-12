class BookSearchesController < ApplicationController
  def new
  end

  def index
    if params[:keyword]
      @book_searches = RakutenWebService::Books::Book.search(title: params[:keyword], booksGenreId: params[:booksGenreId])
    end
  end

  def show
  end

end
