class ReviewsController < ApplicationController
  def new
    @review = Review.new
    2.times {@review.ratings.build}
    results = RakutenWebService::Books::Book.search(isbn: params[:isbn])
    @book = Book.new(read(results.first))
    session[:isbn] = params[:isbn]
  end

  def create
    @book = Book.find_or_initialize_by(isbn: params[:review][:isbn])
    unless @book.persisted?
      results = RakutenWebService::Books::Book.search(isbn: params[:review][:isbn])
      @book = Book.new(read(results.first))
    end
    @book.save
    @review = current_user.reviews.build(review_params)
    @review.book_id = @book.id
    review_find = Review.where(book_id:@book.id).where(user_id: current_user.id)
    review_count = review_find.count
    if review_count < 1
      if @review.save
        redirect_to book_path(@book.id), notice: 'レビューを登録しました！'
      else
        redirect_to new_book_review_path(isbn: session[:isbn]), notice: '内容を入力してください！'
      end
    else
      redirect_to book_path(@book.id), notice: 'レビューは1つしか登録できません'
    end
    session[:isbn] = nil
  end

  def edit
    @book = Book.find(params[:book_id])
    @review = Review.find(params[:id])
    unless current_user.id == @review.user.id
      redirect_to book_path(@book.id), notice: '作成者以外は編集できません'
    end
  end

  def update
    @book = Book.find(params[:book_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to books_path
    else
      render:new
    end
  end

  def destroy

  end

  private

  def review_params
    params.require(:review).permit(:title,:content,ratings_attributes:[:id,:point,:category_id,:book_id,:_destroy]).merge(user_id: current_user.id)
  end

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
