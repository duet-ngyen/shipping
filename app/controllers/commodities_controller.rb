class CommoditiesController < ApplicationController
  before_action :set_commodity, only: [:show]

  def index
    @commodities = Commodity.available.order("created_at desc")
    @users       = User.all

    respond_to do |format|
      format.html
      format.json {
        render json: {
          commodities: @commodities,
          users:       @users
        }
      }
    end
  end

  def show
    @bids = @commodity.bids.preload(:shipper).order("created_at desc")
  end

  private

  def set_commodity
    @commodity = Commodity.preload(:shop_owner).find(params[:id])
  end
end
