require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      username: "testuser",
      email: "test@example.com",
      password: "password123",
      password_confirmation: "password123"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input[name=?]", "user[username]"
    end
  end
end
