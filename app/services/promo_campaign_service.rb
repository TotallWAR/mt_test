class PromoCampaignService

  def self.get_discount_by_campaign_type (type, items)
    case type
    when CheckoutHelper::CAMPAIGN_TYPE[:good_discount]
      return calc_good_discount(items)
    when CheckoutHelper::CAMPAIGN_TYPE[:basket_discount]
      return calc_good_discount(items)
    else
      return 0
    end
  end

  # expecting a group of items of ONE type - not all items in a basket
  # SCHEME OF RULES: { "item_amount": int, "discount": int }
  def self.calc_good_discount(items)
    # all of items has the same companies into this method
    discounts = items[0].promo_campaigns.map do |campaign|
      rules = JSON.parse(campaign.rules)
      if items.length >= rules['item_amount']
        return rules['discount']
      end
      return 0
    end
    return discounts.sum
  end

  # expecting all of items in basket
  # SCHEME OF RULES: { "min_total_price": int, "discount": int }
  # items are passed too because it may will appear a campaign with additional logic
  def self.calc_basket_discount(campaign, total_price, items)
    rules = JSON.parse(campaign.rules)
    if total_price >= rules['min_total_price']
      return rules['discount']
    end
  return 0
  end

end