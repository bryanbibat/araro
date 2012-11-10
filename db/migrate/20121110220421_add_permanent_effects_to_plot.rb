class AddPermanentEffectsToPlot < ActiveRecord::Migration
  def change
    add_column :plots, :element, :string
    add_column :plots, :scared_birds, :string
  end
end
