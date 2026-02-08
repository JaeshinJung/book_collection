require 'rails_helper'

RSpec.describe Book, type: :model do
  # Sunny Day
  it "is valid with valid attributes" do
    book = Book.new(title: "Harry Potter", author: "Rowling", price: 10, published_date: Date.today)
    expect(book).to be_valid
  end

  # Rainy Day: invalid without title, author, price, date
  it "is not valid without a title" do
    expect(Book.new(title: nil)).to_not be_valid
  end
  it "is not valid without an author" do
    expect(Book.new(author: nil)).to_not be_valid
  end
  it "is not valid without a price" do
    expect(Book.new(price: nil)).to_not be_valid
  end
  it "is not valid without a published_date" do
    expect(Book.new(published_date: nil)).to_not be_valid
  end
end
