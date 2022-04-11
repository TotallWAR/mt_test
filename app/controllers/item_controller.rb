class ItemController < ApplicationController
  def show
    @props = { items: [] }
    @item = Item.find_by_code(params[:id])
    return render json: @item
  end
end
