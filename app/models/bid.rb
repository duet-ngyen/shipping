class Bid < ApplicationRecord
  belongs_to :shipper, class_name: "User"
  belongs_to :commodity

  # validates :commodity, uniqueness: { scope: [:commodity_id, :shipper_id], message: "{{value}} is already taken" }
  validates_uniqueness_of :commodity, scope: :shipper, message: "was bided before"
end
