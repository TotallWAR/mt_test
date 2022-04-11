class AddTypeToPromoCampaigns < ActiveRecord::Migration[6.0]
  def change
    add_column :promo_campaigns, :type, :string
  end
end
