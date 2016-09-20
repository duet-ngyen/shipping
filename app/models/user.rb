class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:shop_owner, :shipper]

  has_many :post_commodities, class_name: "Commodity", foreign_key: :shop_owner_id
  has_many :pick_commodities, class_name: "Commodity", foreign_key: :shipper_id
end
