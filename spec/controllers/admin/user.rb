require "rails_helper"

RSpec.describe Admin::UsersController, type: :controller do

  before do
    user = FactoryGirl.create(:user, is_admin: true)
    sign_in user
  end

  context "GET #index" do
    it "should render index" do
      get :index
      expect(response).to render_template "index"
    end
  end

  context "DELETE #destroy" do
    let!(:user) {FactoryGirl.create(:user)}

    it "should delete user after delete success" do
      expect {delete :destroy, id: user.id}.to change(User, :count).by(-1)
    end

    it "should redirect to admin_users_path after delete" do
      delete :destroy, id: user.id
      expect(response).to redirect_to(admin_users_path)
    end

    it "should after delete fail" do
      user.destroy
      delete :destroy, id: user.id
      expect(flash[:danger]).to be_present
    end
  end
end
