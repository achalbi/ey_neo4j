require 'rails_helper'

RSpec.describe "users/show", :type => :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "Name",
      :mood => "Mood",
      :status => "Status",
      :uid => "Uid",
      :username => "Username"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Mood/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Uid/)
    expect(rendered).to match(/Username/)
  end
end
