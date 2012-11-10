class CreatePlots < ActiveRecord::Migration
  def change
    create_table :plots do |t|
      t.references :user
      t.references :variety
      t.integer :days
      t.string :plow
      t.string :pesticide
      t.decimal :fertilizer_rate
      t.integer :weeding_start
      t.string :thresher

      t.timestamps
    end
    add_index :plots, :user_id
    add_index :plots, :variety_id
  end
end
