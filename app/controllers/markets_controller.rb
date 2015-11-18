class MarketsController < ApplicationController
  def home
  end
  def index
    @markets = Market.all
  end
  def show
    id = params[:id]
    @market = Market.find(id)
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
