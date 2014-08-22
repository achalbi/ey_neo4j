require 'rails_helper'

RSpec.describe "users/index", :type => :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name",
        :mood => "Mood",
        :status => "Status",
        :uid => "Uid",
        :username => "Username"
      ),
      User.create!(
        :name => "Name",
        :mood => "Mood",
        :status => "Status",
        :uid => "Uid",
        :username => "Username"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Mood".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Uid".to_s, :count => 2
    assert_select "tr>td", :text => "Username".to_s, :count => 2
  end
end
