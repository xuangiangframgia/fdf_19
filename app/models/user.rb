class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable,
    :rememberable, :trackable, :validatable
  has_many :orders, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :suggests, dependent: :destroy

  scope :asc_by_email, ->{order :email}

  def is_user? user
    self == user
  end
end
