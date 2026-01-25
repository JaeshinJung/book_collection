require 'rails_helper'

RSpec.describe Book, type: :model do
  # Sunny Day
  it "is valid with valid attributes" do
    book = Book.new(title: "Harry Potter", author: "J.K. Rowling", price: 10.99, published_date: Date.today)
    expect(book).to be_valid
  end

  # Rainy Day : Without Title
  it "is not valid without a title" do
    book = Book.new(title: nil)
    expect(book).to_not be_valid
  end

  # Rainy Day : if publish date is future
  it "is not valid with a future published_date" do
    book = Book.new(title: "Future Book", published_date: Date.tomorrow)
    expect(book).to_not be_valid
  end
end