class Commodity < ApplicationRecord
  belongs_to :shop_owner, class_name: "User"
  belongs_to :shipper, class_name: "User"
end

