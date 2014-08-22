require 'rails_helper'

RSpec.describe "users/edit", :type => :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "MyString",
      :mood => "MyString",
      :status => "MyString",
      :uid => "MyString",
      :username => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_name[name=?]", "user[name]"

      assert_select "input#user_mood[name=?]", "user[mood]"

      assert_select "input#user_status[name=?]", "user[status]"

      assert_select "input#user_uid[name=?]", "user[uid]"

      assert_select "input#user_username[name=?]", "user[username]"
    end
  end
end
