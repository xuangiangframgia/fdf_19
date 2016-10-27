require "rails_helper"

RSpec.describe Product, type: :model do
  context "association" do
    it {is_expected.to belong_to :category}
    it {is_expected.to have_many :comments}
    it {is_expected.to have_many :order_details}
    it {is_expected.to have_many :orders}
  end

  context "validates" do
    it {expect validate_presence_of :name}
    it {expect validate_presence_of :description}
    it {expect validate_presence_of :price}
    it {expect validate_presence_of :discount}
    it {expect validate_presence_of :image}
    it {expect validate_presence_of :rate}
  end
end
