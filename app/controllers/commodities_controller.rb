class CommoditiesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_commodity, only: [:show]

  def index
    @commodities = if params[:tag].present?
                     Commodity.filter_by_tag(params[:tag], current_user)
                   else
                     Commodity.available.order("created_at desc")
                   end
    # binding.pry
    # @commodities  = Commodity.available.order("created_at desc")
    @users        = User.all
    @current_user = current_user
    @bids         = Bid.all
    respond_to do |format|
      format.html
      format.json {
        render json: {
          commodities:  @commodities,
          users:        @users,
          current_user: @current_user,
          bids:         @bids
        }
      }
    end
  end

  def show
    @bid = Bid.new
    @bids = @commodity.bids.preload(:shipper).order("created_at desc")
  end

  private

  def set_commodity
    @commodity = Commodity.preload(:shop_owner).find(params[:id])
  end
end
