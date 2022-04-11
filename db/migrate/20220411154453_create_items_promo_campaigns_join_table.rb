class CreateItemsPromoCampaignsJoinTable < ActiveRecord::Migration[6.0]
  def change
    # If you want to add an index for faster querying through this join:
    create_join_table :items, :promo_campaigns do |t|
      t.index :item_id
      t.index :promo_campaign_id
    end
  end
end
