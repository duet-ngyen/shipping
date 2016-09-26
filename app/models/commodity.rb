class Commodity < ApplicationRecord
  belongs_to :shop_owner, class_name: "User"
  belongs_to :shipper, class_name: "User"
  has_many :bids, dependent: :destroy

  scope :available, -> {where picked: false}

  class << self
    def filter_by_tag(tag, current_user)
      results = Array.new
      if tag == "yours"
        Commodity.all.each do |commodity|
          results << commodity if commodity.shop_owner == current_user
        end
      elsif tag == "bided"
        Commodity.all.each do |commodity|
          results << commodity if commodity.bids.map(&:shipper_id).include?(current_user.id)
        end
      else
        Commodity.available.each do |commodity|
          results << commodity if (commodity.bids.map(&:shipper_id).exclude?(current_user.id) && commodity.shop_owner != current_user)
        end
      end
      results
    end
  end
end

