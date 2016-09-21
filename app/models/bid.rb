class Bid < ApplicationRecord
  belongs_to :shipper, class_name: "User"
  belongs_to :commodity
end
