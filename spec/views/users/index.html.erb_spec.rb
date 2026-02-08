require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        username: "testuser",
        email: "test@example.com",
        password: "password123",
        password_confirmation: "password123"
      ),
      User.create!(
        username: "testuser2",
        email: "test2@example.com",
        password: "password456",
        password_confirmation: "password456"
      )
    ])
  end

  it "renders a list of users" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("testuser".to_s), count: 2
  end
end
