class CreatePromoCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :promo_campaigns do |t|
      t.string :name
      t.text :rules
      t.datetime :date_from
      t.datetime :date_to

      t.timestamps
    end
  end
end
