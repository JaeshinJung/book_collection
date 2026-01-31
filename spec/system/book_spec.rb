require 'rails_helper'

RSpec.describe 'Book Management', type: :system do
  before do
    driven_by(:rack_test)
  end

  # Sunny Day: Book created correctly
  it 'valid creation of a book' do
    visit new_book_path

    fill_in 'Title', with: 'Harry Potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: '19.99'
    select '2024', from: 'book_published_date_1i'
    select 'January', from: 'book_published_date_2i'
    select '1', from: 'book_published_date_3i'

    click_button 'Create Book'

    # Success Message
    expect(page).to have_content('Book was successfully created.')
  end

  # Rainy Day: Without title
  it 'invalid creation of a book without title' do
    visit new_book_path

    fill_in 'Title', with: ''
    click_button 'Create Book'

    # Fail Message
    expect(page).to have_content("Title can't be blank")
  end

  # Rainy Day: Future Date
  it 'invalid creation of a book with future date' do
    visit new_book_path

    tom = Date.tomorrow

    select tom.year.to_s, from: 'book_published_date_1i'
    select tom.strftime('%B'), from: 'book_published_date_2i'
    select tom.day.to_s, from: 'book_published_date_3i'

    click_button 'Create Book'

    expect(page).to have_content("Published date can't be in the future")
  end
end
