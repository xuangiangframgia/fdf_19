require "rails_helper"

RSpec.describe Admin::SuggestsController, type: :controller do

    before  do
      @user = FactoryGirl.create(:user, is_admin: true)
      sign_in @user
      @suggest = FactoryGirl.create(:suggest)
    end

    it " GET #index" do
      get :index
    end

    describe "PUT #update" do
      it "changes suggest's attributes" do
        put :update, id: @suggest,
          suggest: FactoryGirl.attributes_for(:suggest)
       expect(flash[:success]).not_to be_empty

      end

      it "changes suggest's attributes" do
        put :update, {id: @suggest, suggest: {name: nil}}
       expect(flash[:warning]).not_to be_empty
      end
    end

  describe "DELETE #destroy" do
#     it "delete successfully" do

#       delete :destroy, id: @suggest
#         expect(flash[:success]).not_to be_empty
# end
    it "deletes the user" do
      expect{
        delete :destroy, id: @suggest}.to change(Suggest, :count).by(-1)
    end

  #    it "redirects to contacts#index" do
  #   delete :destroy, id: @suggest
  #   response.should redirect_to root_path
  # end
   it "dont add course with invalid course" do
      delete :destroy, id: @suggest
      expect(response).to redirect_to(suggests_path)
    end

    it "should after delete fail" do
      @suggest.destroy
      expect do
        delete :destroy, id: @suggest
      end.to raise_exception ActiveRecord::RecordNotFound
    end

  end

  describe "#load_suggest" do
    it "suggest not found" do
      delete :destroy, id: -1
      expect(flash[:warning]).not_to be_empty
    end
  end


end
