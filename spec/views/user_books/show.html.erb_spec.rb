require 'rails_helper'

RSpec.describe "user_books/show", type: :view do
  before(:each) do
    user = User.create!(
      username: "testuser",
      email: "test@example.com",
      password: "password123",
      password_confirmation: "password123"
    )
    book = Book.create!(title: "testbook", author: "auth", price: 10, published_date: "2026-01-01")

    assign(:user_book, UserBook.create!(
      user_id: user.id,
      book_id: book.id
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/testuser/)
    expect(rendered).to match(/testbook/)
  end
end
