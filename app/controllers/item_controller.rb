class ItemController < ApplicationController
  def show
    @props = { items: [] }
    @item = Item.find_by_code(params[:id])
    #TODO better handling not found status
    render status: @item ? 200 : :not_found, json: @item
  end
end
