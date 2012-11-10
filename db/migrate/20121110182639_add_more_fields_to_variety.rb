class AddMoreFieldsToVariety < ActiveRecord::Migration
  def change
    add_column :varieties, :buy_price, :decimal
    add_column :varieties, :sell_price, :decimal
    add_column :varieties, :heat_rating, :integer
    add_column :varieties, :salinity_rating, :integer
    add_column :varieties, :draught_rating, :integer
    add_column :varieties, :flood_rating, :integer
  end
end
