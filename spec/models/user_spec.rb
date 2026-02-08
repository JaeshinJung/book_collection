require 'rails_helper'

RSpec.describe User, type: :model do
  it "has many user_books" do
    assc = described_class.reflect_on_association(:user_books)
    expect(assc.macro).to eq :has_many
  end
  it "has many books through user_books" do
    assc = described_class.reflect_on_association(:books)
    expect(assc.macro).to eq :has_many
  end
end
