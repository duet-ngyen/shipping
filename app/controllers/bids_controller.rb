class BidsController < ApplicationController
  def create
    commodity = Commodity.find_by(id: params[:commodity_id])
    bid = commodity.bids.new(
      shipper_id: current_user.id,
      description: params[:bid][:description]
    )
    if bid.save
      flash[:notice] = "Bid success"
    else
      flash[:warning] = bid.errors.full_messages
    end
    redirect_to commodity_path(commodity.id)
  end
end
