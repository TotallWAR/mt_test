class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :promo_campaigns, :type, :campaign_type
  end
end
