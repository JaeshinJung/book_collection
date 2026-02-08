require 'rails_helper'

RSpec.describe "user_books/edit", type: :view do
  before(:each) do
    @user = User.create!(
      username: "testuser",
      email: "test@example.com",
      password: "password123",
      password_confirmation: "password123"
    )
    @book = Book.create!(title: "testbook", author: "auth", price: 10, published_date: "2026-01-01")
    @user_book = assign(:user_book, UserBook.create!(user_id: @user.id, book_id: @book.id))
  end

  it "renders the edit user_book form" do
    render

    assert_select "form[action=?][method=?]", user_book_path(@user_book), "post" do
      assert_select "select[name=?]", "user_book[user_id]"
      assert_select "select[name=?]", "user_book[book_id]"
    end
  end
end
