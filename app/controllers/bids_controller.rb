class BidsController < ApplicationController
  def create
    commodity = Commodity.find(params[:commodity_id])
    bid = commodity.bids.new(
      shipper_id: current_user.id,
      description: params[:description]
    )
    if bid.save
      flash[:notice] = "Bid success"
    else
      flash[:error] = bid.errors.full_messages
    end
    redirect_to commodity_path(commodity.id)
  end
end
