class AddMoreBasicInfoToUser < ActiveRecord::Migration
  def change
    add_column :users, :day, :integer, default: 1
    add_column :users, :cash, :integer, default: 5000.00, precision: 15, scale: 2
    add_column :users, :farm_size, :decimal, default: 5
    add_column :users, :actions_left, :integer, default: 5
  end
end
