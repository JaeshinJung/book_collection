class Book < ApplicationRecord
  has_many :users, through: :user_books
  has_many :user_books

  validates :title, :author, :price, :published_date, presence: true
  validate :published_date_future

  private

  def published_date_future
    if published_date.present? && published_date > Date.today
      errors.add(:published_date, "can't be in the future")
    end
  end
end
