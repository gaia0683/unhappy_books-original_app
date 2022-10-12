class BookSearchesController < ApplicationController
  def new
  end

  def index
    if params[:keyword]
      @book_searches = RakutenWebService::Books::Book.search(title: params[:keyword])
    end
  end

end
