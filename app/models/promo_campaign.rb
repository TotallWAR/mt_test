class PromoCampaign < ApplicationRecord
  has_and_belongs_to_many :items, foreign_key: :promo_campaign_id
end
