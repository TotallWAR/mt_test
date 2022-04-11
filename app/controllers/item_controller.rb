class ItemController < ApplicationController
  def show
    @props = { items: [] }
    @item = Item.find(params[:id])
    return render json: @item
  end
end
