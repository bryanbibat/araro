class CreateVarieties < ActiveRecord::Migration
  def change
    create_table :varieties do |t|
      t.string :name
      t.string :common_name
      t.string :line_designation
      t.references :breeding_institution
      t.integer :year_approved
      t.decimal :ave_yield
      t.decimal :max_yield
      t.integer :maturity
      t.decimal :height
      t.integer :blast_rating
      t.integer :blb_rating
      t.integer :shb_rating
      t.integer :tungro_rating
      t.integer :bph_rating
      t.integer :glh_rating
      t.integer :stemborer_rating
      t.decimal :amylose_content
      t.decimal :protein
      t.decimal :gt_score
      t.decimal :brown_rice
      t.decimal :milling_recovery
      t.decimal :head_rice
      t.decimal :chalky_grains
      t.decimal :immature_grains
      t.decimal :grain_length
      t.decimal :grain_shape
      t.decimal :acceptability_cooked
      t.decimal :acceptability_raw

      t.timestamps
    end
    
    add_index :varieties, :breeding_institution_id

    execute "
      create index on varieties using gin(to_tsvector('english', name));
      create index on varieties using gin(to_tsvector('english', common_name));
      create index on varieties using gin(to_tsvector('english', line_designation));"
  end
end
