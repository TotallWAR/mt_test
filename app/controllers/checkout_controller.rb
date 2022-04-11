

class CheckoutController < ApplicationController
  layout "checkout"

  def index
  end

  def summary
    #TODO validate param
    unless params[:items]
      return render :status => 400
    end
    item_entities = Item.where(code: params[:items])
    if item_entities.length == 0
      return render :status => 404
    end
    items = params[:items].map{ |p| item_entities.find {|e| e.code == p}}

    basket_campaigns = PromoCampaign.where(campaign_type: CheckoutHelper::CAMPAIGN_TYPE[:basket_discount])
    summary = BasketService.calc_basket_summary(items, basket_campaigns)
    render json: summary.nil? ? { error: 'Basket summarising failed' } : summary
  end
end
