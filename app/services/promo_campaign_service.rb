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

  # expecting a group of items - not all items in a basket
  def self.calc_good_discount(items)
  #  TODO
  return 0
  end

  # expecting all of items in basket
  def self.calc_basket_discount(items, campaign)
  #  TODO
  return 0
  end

end