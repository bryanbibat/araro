class AddEventDeckToPlot < ActiveRecord::Migration
  def change
    add_column :plots, :event_deck, :text
  end
end
