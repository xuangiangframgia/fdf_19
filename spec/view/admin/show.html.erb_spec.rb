require "rails_helper"

RSpec.describe "admin/users/show", type: :view do
  let(:user){FactoryGirl.create(:user, is_admin: true)}

  it "should show list user" do
    assign :user, user
    render
    expect(rendered).to include(user.email)
    expect(rendered).to include(user.name)
    expect(rendered).to include(user.phone)
    expect(rendered).to include(user.address)
    expect(rendered).to include l user.created_at, format: :short
    expect(rendered).to include l user.updated_at, format: :long
  end
end
