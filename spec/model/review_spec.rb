require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = User.create(
      name: 'kimu',
      nickname: 'kkk',
      email: 'kimu2@kimu2.com',
      password: 'gaia0683'
    )
    @book = Book.new(
      title: "リング1",
  image: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/0012/9784041880012.jpg?_ex=200x2001",
  author: "鈴木　光司1",
  publisher_name: "KADOKAWA1",
  url: "https://books.rakuten.co.jp/rb/590223/1",
  isbn: 97840418800121
    )
  end
  it 'is valid with a title, and content' do
    @review = Review.new(
      title: 'abc',
      content: 'abc',
      user: @user,
      book: @book
    )
    expect(@review).to be_valid
  end
  it 'is invalid without a title' do
    @review = Review.new(
      title: nil
    )
    expect(@review.valid?).to eq(false)
  end
  it 'is invalid without a content' do
    @review = Review.new(
      content: nil
    )
    expect(@review.valid?).to eq(false)
  end
end
