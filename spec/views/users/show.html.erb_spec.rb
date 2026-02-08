require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    assign(:user, User.create!(
      username: "testuser",
      email: "test@example.com",
      password: "password123",
      password_confirmation: "password123"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/testuser/)
  end
end
