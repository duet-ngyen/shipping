class Commodity < ApplicationRecord
  belongs_to :shop_owner, class_name: "User"
  belongs_to :shipper, class_name: "User"
  has_many :bids, dependent: :destroy

  scope :available, -> {where picked: false}
end

