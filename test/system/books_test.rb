require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
  end

  test "visiting the index" do
    visit books_url
    assert_selector "h1", text: "Books"
  end

  test "should create book" do
    visit books_url
    click_on "New book"

    fill_in "Title", with: @book.title
    fill_in "Author", with: "System Test Author"
    fill_in "Price", with: 29.99

    select "2026", from: "book_published_date_1i"
    select "February", from: "book_published_date_2i"
    select "1", from: "book_published_date_3i"

    click_on "Create Book"

    assert_text "Book was successfully created"
    click_on "Back"
  end

  test "should update book" do
    visit book_url(@book)
    click_on "Edit this book", match: :first

    fill_in "Title", with: "Updated System Title"
    fill_in "Author", with: "Updated System Author"
    fill_in "Price", with: 35.00

    click_on "Update Book"

    assert_text "Book was successfully updated"
    click_on "Back"
  end

  test "should destroy Book" do
    visit book_url(@book)
    accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Book was successfully destroyed"
  end
end
