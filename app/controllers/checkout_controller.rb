

class CheckoutController < ApplicationController
  layout "checkout"

  def index
  end

  def summary
    #TODO validate param
    item_entities = Item.where(code: params[:items])
    items = params[:items].map{ |p| item_entities.find {|e| e.code == p}}

    basket_campaigns = PromoCampaign.where(campaign_type: CheckoutHelper::CAMPAIGN_TYPE[:basket_discount])
    summary = BasketService.calc_basket_summary(items, basket_campaigns)
    render json: summary.nil? ? { error: 'Basket summarising failed' } : summary
  end
end
