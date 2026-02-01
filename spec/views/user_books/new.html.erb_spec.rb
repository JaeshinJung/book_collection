require 'rails_helper'

RSpec.describe "user_books/new", type: :view do
  user = User.create!(username: "testuser")
  book = Book.create!(title: "testbook", author: "auth", price: 10, published_date: "2026-01-01")

  assign(:user_book, UserBook.create!(
    user_id: user.id,
    book_id: book.id
  ))
end

  it "renders new user_book form" do
    render

    assert_select "form[action=?][method=?]", user_books_path, "post" do
      assert_select "select[name=?]", "user_book[user_id]"

      assert_select "select[name=?]", "user_book[book_id]"
    end
  end
end
