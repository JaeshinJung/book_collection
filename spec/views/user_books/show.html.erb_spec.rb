require 'rails_helper'

RSpec.describe "user_books/show", type: :view do
  user = User.create!(username: "testuser")
  book = Book.create!(title: "testbook", author: "auth", price: 10, published_date: "2026-01-01")

  assign(:user_book, UserBook.create!(
    user_id: user.id,
    book_id: book.id
  ))
end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
