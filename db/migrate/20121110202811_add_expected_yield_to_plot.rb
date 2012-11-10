class AddExpectedYieldToPlot < ActiveRecord::Migration
  def change
    add_column :plots, :expected_yield, :decimal
  end
end
