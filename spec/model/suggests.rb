require "rails_helper"

RSpec.describe Suggest, type: :model do

  let(:suggest) {FactoryGirl.create(:suggest)}

  context "association" do
    it {is_expected.to belong_to :user}
  end

  context "validate" do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_presence_of(:body)}
    it {is_expected.to validate_length_of(:body)}
  end
end
