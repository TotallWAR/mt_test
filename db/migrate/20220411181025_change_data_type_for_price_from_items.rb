class ChangeDataTypeForPriceFromItems < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :price, :numeric, precision: 12, scale: 2
  end
end
