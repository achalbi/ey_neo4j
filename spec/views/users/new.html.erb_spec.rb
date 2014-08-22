require 'rails_helper'

RSpec.describe "users/new", :type => :view do
  before(:each) do
    assign(:user, User.new(
      :name => "MyString",
      :mood => "MyString",
      :status => "MyString",
      :uid => "MyString",
      :username => "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_name[name=?]", "user[name]"

      assert_select "input#user_mood[name=?]", "user[mood]"

      assert_select "input#user_status[name=?]", "user[status]"

      assert_select "input#user_uid[name=?]", "user[uid]"

      assert_select "input#user_username[name=?]", "user[username]"
    end
  end
end
