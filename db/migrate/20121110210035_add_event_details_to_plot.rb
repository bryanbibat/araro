class AddEventDetailsToPlot < ActiveRecord::Migration
  def change
    add_column :plots, :current_event, :string
    add_column :plots, :current_event_details, :text
  end
end
