class CommoditiesController < ApplicationController
  def index
    @commodities = Commodity.all
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
end
