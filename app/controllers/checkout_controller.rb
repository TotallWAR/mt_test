

class CheckoutController < ApplicationController
  layout "checkout"

  def index
  end

  def summary
    @items = Item.find(params[:items])
    basket_campaigns = PromoCampaign.find_by_campaign_type(CheckoutHelper::CAMPAIGN_TYPE[:good_discount])
    summary = BasketService.calc_basket_summary(@items, basket_campaigns)
    return render json: summary.nil? ? { error: 'Basket summarising failed' } : summary
  end
end
