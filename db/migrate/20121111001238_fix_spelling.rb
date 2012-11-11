class FixSpelling < ActiveRecord::Migration
  def change
    rename_column :varieties, :draught_rating, :drought_rating
  end
end
