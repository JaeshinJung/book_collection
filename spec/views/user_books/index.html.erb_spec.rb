require 'rails_helper'

RSpec.describe "user_books/index", type: :view do
  before(:each) do
    user = User.create!(username: "testuser")
    book = Book.create!(title: "testbook", author: "auth", price: 10, published_date: "2026-01-01")

    assign(:user_books, [
      UserBook.create!(user_id: user.id, book_id: book.id),
      UserBook.create!(user_id: user.id, book_id: book.id)
    ])
  end

  it "renders a list of user_books" do
    render
    assert_select "tr>td", text: "testuser".to_s, count: 2
    assert_select "tr>td", text: "testbook".to_s, count: 2
  end
end
