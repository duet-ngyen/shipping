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

  end

  private

  def set_commodity
    @commodity = Commodity.find_by(params[:id])
  end
end
