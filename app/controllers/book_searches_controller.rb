class BookSearchesController < ApplicationController
  def new
  end

  def index
    @books = []
    if params[:keyword]
      results = RakutenWebService::Books::Book.search(title: params[:keyword], booksGenreId: params[:booksGenreId],outOfStockFlag: params[:outOfStockFlag])

      results.each do |result|
        book = Book.new(read(result))
        @books << book
      end
    end
  end

  def show
    @book = Book.find_or_initialize_by(isbn: params[:isbn])
    results = RakutenWebService::Books::Book.search(isbn: @book.isbn)
    @book = Book.new(read(results.first))
  end

  private
  def read(result)
    title = result["title"]
    image = result["largeImageUrl"]
    author = result["author"]
    publisher_name = result["publisherName"]
    url = result["itemUrl"]
    isbn = result["isbn"]
    {
      title: title,
      image: image,
      author: author,
      publisher_name: publisher_name,
      url: url,
      isbn: isbn
    }
  end
end
