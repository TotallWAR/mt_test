class BasketService
  def self.calc_basket_summary(items, basket_campaigns)
    total_price = self.get_basket_total_price(items)
    items_discounts = self.get_items_discount(items)
    basket_discounts = self.get_basket_discounts(items, basket_campaigns, total_price - items_discounts)
    return {
      total_price_without_discount: total_price,
      total_price_with_discount: total_price - items_discounts - basket_discounts
    }
  end

  def self.get_basket_total_price(items)
    return items.map { |item| item.price }.sum
  end

  def self.get_items_discount(items)
    if items.respond_to? :group_by
      grouped_items = items.group_by { |item| item.code }
      mapped_groups = grouped_items.keys.map do |k|
        unless grouped_items[k][0].promo_campaigns.nil?
           grouped_items[k][0].promo_campaigns.map { |campaign| PromoCampaignService.get_discount_by_campaign_type(campaign.campaign_type, grouped_items[k]) }.sum
        end
      end
      return mapped_groups.sum
    end
    return 0
  end

  # discounts can be applied for ALL basket promo campaigns (so they are summed)
  def self.get_basket_discounts(items, basket_campaigns, total_price)
    if basket_campaigns.respond_to? :map
      result = basket_campaigns.map { |campaign| PromoCampaignService.calc_basket_discount(campaign, total_price, items) }.sum
      return result
    end
    return 0
  end
end