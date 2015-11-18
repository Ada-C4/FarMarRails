class MarketsController < ApplicationController
  def home
  end
  def index
    @markets = Market.all
    @market_link = "Hi Ima link"
  end
  def show
    id = params[:id]
    @market = Market.find(id)
    # @vendors = Vendor.where("market_id = ?", id)
    # @delete_but = button_to "Delete", { action: :destroy, id: vendor.id}, method: :delete, data: { confirm: "Confirm Deletion"}
  end

  def user_view
    @markets = Market.all
    @market_link = ""
    render "index"
  end

  def create
  end
  def new
  end
  def edit
  end
  def update
  end
end
