class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  scope :asc_by_name, ->{order :name}
end
