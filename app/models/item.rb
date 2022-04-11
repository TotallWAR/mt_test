class Item < ApplicationRecord
  has_and_belongs_to_many :promo_campaigns, foreign_key: :item_id
end
